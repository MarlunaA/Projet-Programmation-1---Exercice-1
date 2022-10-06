type 'a my_list =
  |Nil
  |Cons of 'a * 'a my_list

let string_of_list str_fun u =
  let rec string_content = function
    |Nil -> ""
    |Cons (x, Nil) -> (str_fun x)
    |Cons (x, v) -> (str_fun x) ^ ", " ^ (string_content v)
  in "[" ^ (string_content u) ^ "]" 

let hd u =
  match u with
    |Nil -> None
    |Cons (x, xs) -> Some x


let tl = function
  |Nil -> None
  |Cons (x, xs) -> Some xs


let rec length u =
  match u with
    |Nil -> 0
    |Cons (x,xs) -> 1 + (length xs)


let rec map funab u =
  match u with
    |Nil -> Nil
    |Cons (x,xs) -> Cons(funab x, map funab xs)
