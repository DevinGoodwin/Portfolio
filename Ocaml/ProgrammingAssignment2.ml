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

(* Problem 1.

   Implement a function 'add_opt'. Given two int option inputs a and b, if both are of the
    Some form, return their sum tagged with Some. Otherwise return None.

   Examples:
   add_opt (Some 1) (Some 2) = Some 3
   add_opt None (Some 2) = None
   add_opt (Some 1) None = None
   add_opt None None = None *)
let add_opt (x : int option) (y : int option) : int option =
  match x with
    None -> None
  |
    Some a -> match y with
      Some b -> Some (a+b)
    |
      None -> None;;

let print_intoption (x: int option) =
  match x with
    Some a -> print_string "Some "; print_int a
  |
    None -> print_string "None";;

let _ = print_intoption (add_opt (Some 3) (Some 4))
let _ = print_string "\n"

(* Problem 2.

   Previously in programming assignment 1, we have implemented an 'is_prime' function that
   outputs -1 on a prime number input and the smallest factor of a non-prime input. We have
   are assigning a special meaning to the special value of -1, but using "magic" values
   in general is not a good programming practice. For someone unfamiliar with our code, they
   must be treat "magic" values with great caution. A much better choice is to use option types
   instead of "magic" values, this will allow us to enforce correct handling of special cases
   by leveraging the type system.

   Your new implementation of 'is_prime' outputs None on prime inputs. When given a non-prime
   input, return its smallest factor tagged by Some.

   Examples:
   is_prime 81 = Some 3
   is_prime 7 = None
   is_prime 144 = Some 2
   is_prime 371 = Some 7
   is_prime 53 = None

   Notes:
   * You may assume that inputs are non-negative integers.
   * You may assume inputs are greater than 1. *)
let is_prime (n : int) : int option =   
  let rec aux (i:int) = 
    if n<=i then None
    else
    if n mod i == 0 then (Some i)
    else aux (i+1)
  in aux 2

let _ = print_intoption (is_prime 53)
let _ = print_string "\n"

(* Problem 3.

   Implement the prime factorization function 'factor' using 'is_prime' from problem 1.
   Given an input n, return a list of all of its prime factors.

   Examples:
   factor 12 = [3; 2; 2]
   factor 71 = [71]
   factor 77 = [11; 7]
   factor 98 = [7; 7; 2]
   factor 100 = [5; 5; 2; 2]

   Notes:
   * The order of prime factors in the result does not matter.
   * Your implementation of 'factor' must use 'is_prime' from problem 1. *)
let factor (n : int) : int list =
  let rec aux accum n =
    match is_prime (n) with
      None -> n::accum
    |
      Some a -> aux (a::accum) (n/a)
  in aux [] n 

let string_of_intlist (ls : int list) : string =
  let rec aux (ls : int list) : string =
    match ls with 
      [] -> ""
    | 
      [a] -> string_of_int a 
    |
      h::t -> string_of_int h ^ ";" ^ aux t
  in "[" ^ (aux ls) ^ "]"

let print_intlist (ls : int list) : unit = print_endline (string_of_intlist ls)

let _ = print_intlist (factor 100)

(* Problem 4.

   In assingment 1, you have implemented a 'dot_product' function that computes the
   dot product operation of linear algebra. You only needed to consider inputs of
   the same length. In this problem you must consider inputs of possibly differing
   lengths. When 'dot_product' takes inputs of differing lengths, output None, otherwise
   tag the result with Some.

   Examples:
   dot_product [1; 1] [1; 1] = Some 2
   dot_product [1] [1; 1] = None
   dot_product [1; 1] [1] = None
   dot_product [] [] = None

   Notes:
   * Inputs may be of different lengths.
   * If either input is empty, return None.
   * StackOverflow errors are not accepted. *)
let dot_product (xs : int list) (ys : int list) : int option =
  if xs == [] then None
  else
    let rec aux accum xs2 ys2 = 
      match (xs2, ys2) with
        [],[]-> Some (accum)
      |
        [],_ -> None
      |
        _,[] -> None
      |
        (hx::tx, hy::ty)-> aux (accum+(hx*hy)) tx ty
    in aux 0 xs ys

let _ = print_intoption (dot_product [] [])
let _ = print_string "\n"
(* Problem 5.

   In this problem, you are to implement a function 'find_max'. When given a list of
   ints, find the one with greatest value and return it tagged with Some. If no ints
   are found in the list, return None.

   Examples:
   find_max [1; 2; 3] = Some 3
   find_max [7; 10; 1; 6] = Some 10
   find_max [] = None

   Notes:
   * StackOverflow errors are not accepted *)
let find_max (ls : int list) : int option = 
  if ls == [] then None
  else
    let rec aux max ls =
      match ls with
        [] -> Some max
      |
        h::t -> if max<h then aux h t
        else aux max t
    in aux 0 ls

let _ = print_intoption (find_max [])
let _ = print_string "\n"

(* Problem 6.

   A list could be used as a dictionary that maps values to values. We will use lists
   of type (string * int) list as dictionaries to map strings to ints. We can implement
   a 'find_key' function that when given a dictionary and a key (string type), outputs
   the value associated to the key (int type) tagged with Some if said key exists within
   the dictionary. If the searched for key does not exist in the dictionary, output None.

   Examples:
   find_key [("a", 1); ("b", 2); ("c", 3)] "b" = Some 2
   find_key [("a", 1); ("b", 2); ("c", 3)] "c" = Some 3
   find_key [("a", 1); ("b", 2); ("c", 3)] "d" = None
   find_key [("a", 1); ("b", 2); ("c", 3); ("b", 4)] "b" = Some 2

   Notes:
   * If the list contains duplicate key entries, output the value associated to the "leftmost"
     entry. *)
let rec find_key (dict : (string * int) list) (key : string) : int option =
  match dict with
    []-> None
  |
    h::t -> match h with
      (a,b) -> if a=key then Some b
      else find_key t key


let _ = print_intoption (find_key [("a", 1); ("b", 2); ("c", 3); ("b", 4)] "b")
let _ = print_string "\n"

(* Problem 7.

   Implement a function 'to_freq', that when given a string list, output a list of
   type (string * int) list such that each string is associated with its frequency in
   the original input.

   Examples:
   to_freq ["a"; "a"; "b"; "c"; "b"; "a"] = [("a", 3); ("b", 2), ("c", 1)]
   to_freq ["jack"; "Jack"; "JACK"] = [("jack", 1); ("Jack", 1); ("JACK", 1)]

   Notes:
   * You do not need to consider the order of entries in the output.
   * There should be no entries with repeated strings in your output.
     An output such as [("a", 1); ("a", 2)] is not accpeted.
   * Strings are case sensitive. "jack", "Jack" and "JACK" are considered different
     and their frequencies are counted independently. *)
let to_freq (ls : string list) : (string * int) list = 
  let rec aux real accum =
    match accum with
      []->real
    |
      h::t->let rec count key num ls extras =
              match ls with
                []-> aux ((key,num)::real) extras
              |
                h2::t2-> if key=h2 then count key (num+1) t2 extras
                else count key num t2 (h2::extras)
      in count h 1 t []
  in aux [] ls


let rec print_tuples ls =
  match ls with
    [] -> ()
  | 
    (a, b) :: rest -> print_string "("; print_string a; print_string " "; print_int b; print_string ")"; print_tuples rest

let _ = print_tuples (to_freq ["a"; "a"; "b"; "c"; "b"; "a"])
let _ = print_string "\n"


(* Problem 8.

   Implement a function 'filter_prime', that when given an int list removes
   all prime numbers from this list.

   Examples:
   filter_prime [2; 3; 4; 5; 6] = [4; 6]
   filter_prime [7; 8; 9; 10; 11; 12] = [8; 9; 10; 12]

   Notes:
   * You may assume all int elements of the input list are greater than 1.
   * You MUST use the 'is_prime' function implemented in this assignment. *)
let rec filter_prime (ls : int list) : int list =
  let rec aux accum ls = 
    match ls with
      [] -> accum
    |
      h::t-> if (is_prime h) = None then aux accum t
      else h::(aux accum t)
  in aux [] ls

let _ = print_intlist (filter_prime [7; 8; 9; 10; 11; 12])
(* Problem 9.

   Implement a function 'concat' that when given a list of int lists,
   appends them all together into a single list.

   Examples:
   concat [[1; 2; 3]; [4; 5; 6]; [7; 8; 9]] = [1; 2; 3; 4; 5; 6; 7; 8; 9]
   concat [[1; 2; 3]; []; [7; 8]] = [1; 2; 3; 7; 8]

   Notes:
   * You may NOT use any functions from the OCaml List module.
   * You may NOT use the '@' operator. *)
let rec concat (lss : int list list) : int list = 
  let rec aux (accum : int list) ls =
    match ls with
      [] -> accum
    |
      h::t -> let rec aux2 accum2 ls2 =
                match ls2 with
                  [] -> aux accum2 t
                |
                  h2::t2 -> h2::(aux2 accum2 t2)
      in aux2 [] h
  in aux [] lss

let _ = print_intlist (concat [[1; 2; 3]; [4; 5; 6]; [7; 8; 9]])
(* Problem 10.

    Matrix transpose is a fundamental operation in linear algebra. When
    given a matrix (a grid filled numbers) of dimensions MxN (columns x rows),
    the transpose operation will return back a new matrix with dimensions NxM.
    This is done by taking the original rows as new columns and original columns
    as new rows.

    The following demonstrates the process of transposing a 5x3 matrix.

    Oringinal (5x3):
    0  1  2  3  4
    5  6  7  8  9
    10 11 12 13 14

    Transposed (3x5):
    0 5 10
    1 6 11
    2 7 12
    3 8 13
    4 9 14

    A matrix can be represented as a int list list type, the nested
    structure of an int list list can be used to encode a matrix. Your task
    is to implement a 'transpose' function that performs the transpose
    operation on matrices encoded as nested lists.

    Examples:
    transpose
     [[0;  1;  2;  3;  4];
      [5;  6;  7;  8;  9];
      [10; 11; 12; 13; 14]]
    =
     [[0; 5; 10];
      [1; 6; 11];
      [2; 7; 12];
      [3; 8; 13];
      [4; 9; 14]]

    transpose
     [[0; 5; 10];
      [1; 6; 11];
      [2; 7; 12];
      [3; 8; 13];
      [4; 9; 14]]
    =
     [[0;  1;  2;  3;  4];
      [5;  6;  7;  8;  9];
      [10; 11; 12; 13; 14]]

   Notes:
   * You may assume all nested int lists are of the same length.
   * (optional challenge) Implement transpose such that each int element of
     the input is only encountered by transpose or any of its helper functions
     at most once, or in other words a single pass. *)

let makerow (ls:int list) (lss:int list list) =
  let rec aux (ls2:int list) (lss2:int list list)=
    match ls2 with
      []->[]
    |
      h::t-> match lss2 with
        h2::t2-> h::(aux h2 t2)
      |
        []->h::(aux [] [])
  in aux ls lss 

let makesmallmat (ls:int list) (lss:int list list) : int list list =
  let rec aux (ls2:int list) (lss2:int list list)=
    match ls2 with
      []->[]
    |
      h::t-> match lss2 with
        h2::t2-> t::(aux h2 t2)
      |
        []-> t::(aux [] [])
  in aux ls lss

let transpose (lss : int list list) : int list list = 
  let rec helper smallmat =
    match smallmat with
      []-> []
    |
      row1::restrow-> if(makerow row1 restrow)!=[] then (makerow row1 restrow)::(helper (makesmallmat row1 restrow))
      else []
  in helper lss


(* Problem 11.

   Pascal's triangle is a important and useful tool in mathematics. The numbers
   computed by it have connections to probability theory, combinatorics and algrebra.
   Your task is to implement a 'triangle' function that computes Pascal's triangle
   (encoded as int list list) up to a given row.

       1
      1 1
     1 2 1
    1 3 3 1
   1 4 6 4 1

   To compute an element for a new row, we sum up the two numbers above it in the
   previous row. See https://en.wikipedia.org/wiki/Pascal's_triangle for a formal
   description.

   Examples:
   triangle 1 = [[1]]

   triangle 2 =
   [[1];
   [1;1]]

   triangle 3 =
   [[1];
   [1;1];
   [1;2;1]]

   triangle 4 =
   [[1];
   [1;1];
   [1;2;1]
   [1;3;3;1]]

   triangle 5 =
   [[1];
   [1;1];
   [1;2;1]
   [1;3;3;1]
   [1;4;6;4;1]]

   Notes:
 * You may assume the input to triangle is a positive integer.
 * (optional challenge) Implement triangle such that each int element of
   the triangle is only encountered by triangle or any of its helper functions
   at most once, or in other words a single pass. *)

let buildrow row =
  let rec aux first second =
    match first with
      []-> []
    |
      h::t->match second with
        []-> []
      |
        h2::t2-> (h+h2)::(aux t t2)
  in aux (concat [[0];row]) (concat [row;[0]])

let triangle (n : int) : int list list =
  let rec aux cur_row i =
    if i = n then []
    else cur_row::(aux (buildrow cur_row) (i+1))
  in aux [1] 0
