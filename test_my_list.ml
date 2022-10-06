let string_of_list str_fun l = 
  let rec string_content = function
    | My_list.Nil  -> ""
    | My_list.Cons(x, Nil)  -> (str_fun x)
    | My_list.Cons(x, l) -> (str_fun x) ^ ", " ^ (string_content l) 
  in "[" ^ (string_content l) ^ "]" in

let string_of_nat_list = string_of_list string_of_int in
let string_of_string_list = string_of_list (fun x -> x) in

let empty = My_list.Nil in
let one = My_list.Cons("a",My_list.Nil) in 
let lst = My_list.Cons(1 ,My_list.Cons(3, My_list.Cons(6, My_list.Cons(10, My_list.Cons(15, My_list.Cons(21, My_list.Cons(28, My_list.Cons(36, My_list.Cons(45, My_list.Cons(55, My_list.Nil)))))))))) in

let test_hd () = 
  Printf.printf "Tête de %s : %s.\n" (string_of_string_list one) (Option.get (My_list.hd one));
  Printf.printf "Tête de %s : %d.\n\n" (string_of_nat_list lst) (Option.get (My_list.hd lst))

in let test_tl () = 
  Printf.printf "Queue de %s : %s.\n" (string_of_string_list one) (string_of_string_list (Option.get (My_list.tl one)));
  Printf.printf "Queue de %s : %s.\n\n" (string_of_nat_list lst) (string_of_nat_list (Option.get (My_list.tl lst)))

in let test_length () = 
  Printf.printf "Taille de %s : %d.\n" (string_of_string_list one) (My_list.length one);
  Printf.printf "Taille de %s : %d.\n" (string_of_nat_list lst) (My_list.length lst);
  Printf.printf "Taille de %s : %d.\n\n" (string_of_string_list empty) (My_list.length empty)

in let test_map ()= 
  Printf.printf "Map de (x -> xx) sur %s : %s.\n" (string_of_string_list one) (string_of_string_list (My_list.map (fun s -> s ^ s) one));
  Printf.printf "Map de (x -> 2x) sur %s : %s.\n" (string_of_nat_list lst) (string_of_nat_list (My_list.map (fun n -> 2 * n) lst));
  Printf.printf "Map de (x -> 2x) sur %s : %s.\n\n" (string_of_nat_list empty) (string_of_nat_list (My_list.map (fun n -> 2 * n) empty));

in test_hd(); test_tl(); test_length(); test_map()
