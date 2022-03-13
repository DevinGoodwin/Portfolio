(* Honor code comes here:

   First Name:Devin 
   Last Name:Goodwin
   BU ID:U51996983

   I pledge that this program represents my own
   program code and that I have coded on my own. I received
   help from no one in designing and debugging my program.
   I have read the course syllabus of CS 320 and have read the sections on Collaboration
   and Academic Misconduct. I also understand that I may be asked to meet the instructor
   or the TF for a follow up interview on Zoom. I may be asked to explain my solution in person and
   may also ask you to solve a related problem. *)

(* IMPORTANT
   Problems that do not satisfy requirements will have points deducted from
   your Gradescope score during manual grading.

   Requirements for the assignemnt.
   * You may NOT add or remove the 'rec' keyword.
   * Your helper functions may NOT use the 'rec' keyword.
   * You may not use ANY library functions.
   * You may not use list operators such as '@'.
   * The standard library will be disabled during grading, code
     dependent on library code will fail to compile. *)

(* Problem 1.
   Implement the filter higher-order function. *)
let rec filter (f : 'a -> bool) (ls : 'a list) = 
  match ls with
    []->[]
  |
    h::t->if (f h) then h::filter f t else filter f t

(* Problem 2.
   Implement the map higher-order function. *)
let rec map (f : 'a -> 'b) (ls : 'a list) : 'b list = 
  match ls with
    []->[]
  |
    h::t-> (f h)::map f t

(* Problem 3.
   Implement the fold_left higher-order function. *)
let rec fold_left (f : 'a -> 'b -> 'a) (acc : 'a) (ls : 'b list) : 'a =
  match ls with
    []->acc
  |
    h::t-> fold_left f (f acc h) t

(* Problem 4.
   Implement the fold_right higher order function. *)
let rec fold_right (f : 'a -> 'b -> 'b) (ls : 'a list) (acc : 'b) : 'b =
  match ls with
    []->acc
  |
    h::t-> f h (fold_right f t acc)

(* Problem 5.
   Implement append in using fold_right. You may not use the 'rec' keyword. *)
let append (ls1 : 'a list) (ls2 : 'a list) : 'a list =  
  fold_right (fun x ls -> x::ls) ls1 ls2

(* Problem 6.
   Implement a function nth_opt that finds the nth element in a list if it exists.

   Examples:
   nth_opt [1; 2; 3] 0 = Some 1
   nth_opt [1; 2; 3] 1 = Some 2
   nth_opt [1; 2; 3] 3 = None
   nth_opt [] 3 = None
*)

let length l = fold_left (fun a _ -> a + 1) 0 l

let nth_opt (ls : 'a list) (n : int) : 'a option = 
  match ls with
    []->None
  |
    _ -> if n >= (length ls) then None 
    else Some( (fold_left  (fun x te -> if x=n then (te+length ls) else (x+1)) 0 ls)- (length ls - (n+1)) -length ls)

(* let print_intoption (x: int option) =
   match x with
    Some a -> print_string "Some "; print_int a
   |
    None -> print_string "None"

   let _ = print_intoption (nth_opt [9; 1; 9; 8; 98; 9; 63; 34; 3; 7; 8; 4; 5; 9; 3; 4; 0; 2; 45; 2; 1; 1; 2; 49; 7; 4; 0; 84; 7; 3; 1; 60; 3; 6; 2; 3; 3; 1; 6; 8; 3; 5; 3; 4; 35; 7; 3; 1; 5; 2; 8; 64; 9; 1; 1; 52; 32; 1; 1; 4; 95; 3; 4; 1; 8; 97; 1; 82; 0; 9; 7; 6; 2; 7; 3; 6; 2; 38; 92; 97; 6; 7; 47; 5; 59; 0; 61; 84; 4; 5; 1; 2; 2; 58; 9; 5; 3; 6; 1; 1;] 19)
   let _ = print_string "\n" *)

(* Problem 7.
   Given an int list, add_all_opt attempts to add all elements in the
   list. If the list is empty, return None, otherwise return the sum tagged
   by Some.

   Examples:
   add_all_opt [1; 2] = Some 3
   add_all_opt [3; 4; 5] = Some 12
   add_all_opt [] = None *)
let add_all_opt ls = 
  match ls with
    []-> None
  |
    _ -> Some (fold_left (fun x b -> x+b) 0 ls)

(* let _ = print_intoption (add_all_opt [])
   let _ = print_string "\n" *)

(* Problem 8.
   Given an int list, add_all_even_opt attempts to add all even elements
   in the list. If the list is empty, return None, otherwise return the sum
   tagged by Some.

   Examples:
   add_all_even_opt [1; 2] = Some 2
   add_all_even_opt [3; 4; 5; 6] = Some 10
   add_all_even_opt [] = None *)
let add_all_even_opt (ls : int list) : int option = 
  match ls with
    []-> None
  |
    _ -> fold_left (fun x b -> match x with
        None-> if (b mod 2)==0 then Some b else x
      |
        Some a -> if (b mod 2)==0 then Some (a+b) else Some(a)) None ls 

(* let _ = print_intoption (add_all_even_opt [57; 0; 5; 7; 1; 1; 0; 5])
   let _ = print_string "\n" *)

(* Problem 9.
   Given an int list list, sum up all int elements. The int list list
   is guaranteed to be non-empty. The nested int lists may be of
   different lengths.

   Examples:
   sum_matrix [[1; 2]; [3; 4]] = 10
   sum_matrix [[1]; [3; 4]] = 8
   sum_matrix [[1; 2]; [3]] = 6 *)
let sum_matrix (lss : int list list) : int = 
  fold_left (fun x b -> (fold_left (fun y c -> y+c) 0 b)+x) 0 lss

(* let _ = print_int (sum_matrix [[1; 2]; [3]])
   let _ = print_string "\n" *)

(* Problem 10.
   Implement 'find_key' from pa2. *)
let find_key (dict : (string * int) list) (key : string) : int option =
  match dict with
    []-> None
  |
    _-> fold_right (fun b x -> match b with
        (p,q)->if p=key then Some q else x) dict None

(* let _ = print_intoption (find_key [("a", 1); ("b", 2); ("c", 3); ("b", 4)] "b")
   let _ = print_string "\n" *)

(* Problem 11.
   Implement 'to_freq' from pa2. *)
let removeDups ls =
  fold_left (fun accum (key,num) -> if accum=[] then [(key,num)] else 
              if (fold_left (fun x (key2,num2) -> if key=key2 then 1 else x) 0 accum) == 1 then accum else (key,num)::accum )  [] ls

let to_freq (ls : string list) : (string * int) list = 
  removeDups (fold_left (fun a x -> (x,fold_left (fun b y-> if y=x then b+1 else b) 0 ls)::a) [] ls )

(* let rec print_tuples ls =
   match ls with
    [] -> ()
   | 
    (a, b) :: rest -> print_string "("; print_string a; print_string " "; print_int b; print_string ")"; print_tuples rest

   let _ = print_tuples (to_freq ["a"; "a"; "b"; "c"; "b"; "a"])
   let _ = print_string "\n" *)

(* Problem 12.
   Implement 'concat' from pa2. *)
let concat (lss : 'a list list) : 'a list = 
  fold_right (fun x ls -> append x ls) lss []

(* Problem 13.
   When given a list ls of type 'a list, and a function f of
   type 'a -> 'b list, flatMap maps f across all elements of
   ls uniformly and flattens the result into a 'a list.

   Example:
   flatMap [1; 2] (fun x -> [x; x+1]) = [1; 2; 2; 3]
   flatMap [4; 6; 8] factor = [2; 2; 2; 3; 2; 2; 2] *)
let flatMap (ls : 'a list) (f : 'a -> 'b list) : 'b list = 
  concat (map f ls)

(* let string_of_intlist (ls : int list) : string =
   let rec aux (ls : int list) : string =
    match ls with 
      [] -> ""
    | 
      [a] -> string_of_int a 
    |
      h::t -> string_of_int h ^ ";" ^ aux t
   in "[" ^ (aux ls) ^ "]"

   let print_intlist (ls : int list) : unit = print_endline (string_of_intlist ls)

   let _ = print_intlist (flatMap [1; 2] (fun x -> [x; x+1])) *)

(* Problem 14.
   Given 3 lists ls1, ls2 and ls3, triples enumerates a list
   containing triples of all their combinations (similar to theory homework 2).
   You do not need to worry about the order of the triples in the output.

   Example:
   triples [1; 2] [3] [4; 5] = [(1, 3, 4); (1, 3, 5); (2, 3, 4); (2, 3, 5) ]
   triples [1; 2] [3; 4] [5; 6] =
     [(1, 3, 5); (1, 3, 6); (1, 4, 5); (1, 4, 6); (2, 3, 5); (2, 3, 6); (2, 4, 5); (2, 4, 6)] *)

(* let rec print_tuples2 ls =
   match ls with
    [] -> ()
   | 
    (a, b, c) :: rest -> print_string "("; print_int a; print_string " "; print_int b; print_string " "; print_int c; print_string ")"; print_tuples2 rest *)


let triples (ls1 : 'a list) (ls2 : 'b list) (ls3 : 'c list) :
  ('a * 'b * 'c) list =
  fold_left (fun x a -> append (fold_left (fun y b -> append (fold_left (fun z c -> (a,b,c)::z) [] ls3) y) [] ls2) x) [] ls1   

(* let _ = print_tuples2 (triples [1; 2] [3] [4; 5])
   let _ = print_string "\n" *)
(* Problem 15.
    Given an element x and a list ls, insert x into all possible positions
    in ls. Collect all results as a nested list output.

    Examples:
    insert 4 [1; 2; 3] = [[4; 1; 2; 3]; [1; 4; 2; 3]; [1; 2; 4; 3]; [1; 2; 3; 4]]
    insert 1 [4; 3; 2] = [[1; 4; 3; 2]; [4; 1; 3; 2]; [4; 3; 1; 2]; [4; 3; 2; 1]]
    insert 1 [] = [[1]] *)

(* let rec print_intlistlist lss =
   match lss with
    [] -> ()
   |
    h::t-> print_string "["; print_string (string_of_intlist h); print_string ";"; print_intlistlist t; print_string "]" *)


let addElement i lss =
  fold_right (fun x b -> (i::x)::b) lss []


let insert (x : 'a) (ls : 'a list) : 'a list list  = 
  match (fold_right (fun e (small,big) -> if small=[] then ([e],[[x;e];[e;x]]) 
                      else (e::small, (append [x;e] small)::(addElement e big))) ls ([],[]) ) 
  with
  | (a,b)-> match b with
      []-> [[x]]
    |
      any-> any

(* let _ = print_intlistlist (insert 4 [])
   let _ = print_string "\n" *)


(* Problem 16.
   Given a list ls, generate all possible permutations of ls.
   Collect these permutations a nested list output. The order
   of generated permutations does not matter.

   Examples:
   perm [] = [[]]
   perm [1] = [[1]]
   perm [1; 2] = [[1; 2]; [2; 1]]
   perm [1; 2; 3] = [[1; 2; 3]; [2; 1; 3]; [2; 3; 1]; [1; 3; 2]; [3; 1; 2]; [3; 2; 1]] *)


let perm (ls : int list) : int list list = 
  match ls with
    []->[[]]
  |
    _-> fold_right (fun a b ->if b=[] then [[a]] else concat (map (insert a) b)) ls [] 


(* let test = concat (map (insert 1) [[2;3]])
   let _ = print_intlistlist (test) 
   let _ = print_intlistlist (perm [1;2;3]) *)