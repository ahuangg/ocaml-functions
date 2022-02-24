(** 
    Alan Huang  
    Ritwik Banerjee 
    CSE-216 Spring2022 
    HW#1
*)

(**#1*)
let rec pow x n = 
    match n with 
    | 0 -> 1    (** base case for when exponent is 0*)
    | 1 -> x    (** base case stops recursion when n = 1*)
    | _ -> x * pow x (n-1);;    (** multiplies x by itself n-1 times *)
(** pow 2 3;; *)

let rec float_pow x n = (** same as normal pow except with floats *)
    match n with 
    | 0 -> 1.   
    | 1 -> x
    | _ -> x *. float_pow x (n-1);; 
(** pow 3.2 2*)

(**#2*)
let rec compress lst = 
    match lst with 
    | [] -> [] (** base case for when list is empty -> returns an empty list*)
    | [x] -> [x]    (** base case for when there is only one element in the list -> returns the single element(for when there are odd num of values in the list) *)
    | h::t -> if h = List.hd then compress t else  h::compress t;; (** compares head with the head of the tail, if they are equal return the tail, other wise return the h appened with the recurive call of the tail *)
(**compress ["a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e"];;*)

(**#3*)
let rec remove_if lst funct = 
    match lst with 
    | [] -> []  (** base case returns exmpty list if there is nothing to compare to or if the list is empty *)
    | h::t -> if funct h then remove_if t funct else  h::remove_if t funct;; (** appends h to the recursive call on t or only recursively call t depending on the output of the function with h as input *)
(**remove_if [1;2;3;4;5] (fun x -> x mod 2 = 1);;*)

(**4*)
let rec slice lst x y = 
    match lst with  
    | [] -> []  (** base case return empty lsit when list is empty *)
    | h::t -> if y > 1 && x < 1 then h::slice t (x-1) (y-1) else slice t (x-1) (y-1);; (** appends h with the recurive call of t or recursively call t only depending if the index is between the range x - y*)
(**slice ["a";"b";"c";"d";"e";"f";"g";"h"] 2 6;;*)

(**5*)
let rec equivs funct lst = ;;

(**#6*)
let rec isPrime x y = 
    if (x == 2 || y * y > x) then true
    else if (x mod y == 0) then false
    else isPrime x (y + 1);;
    
let goldbachpair x =
    let rec aux y =
        if isPrime y 2 && isPrime (x - y) 2 then (y, x - y) else aux(y + 1) in aux 2;;
(** goldbachpair 10;;*)

(**#7*)
let rec equiv_on f g lst = 
    match lst with 
    | [] -> true
    | h::t -> if (f h = g h) then equiv_on f g t else false;; 
(**let f i = i * i;; let g i = 3 * i;; equiv_on f g [3];; equiv_on f g [1;2;3];;*)

(**#8*)
let rec pairwisefilter cmp lst = 
    match lst with
    | [] -> []
    | h::[] -> [h]
    | h::t -> cmp h (List.hd t)::pairwisefilter cmp (List.tl t);;
(**pairwisefilter min [14; 11; 20; 25; 10; 11];; pairwisefilter shorter ["and"; "this"; "makes"; "shorter"; "strings"; "always"; "win"];;*)

(**#9*)
let rec polynomial_helper lst funct = 
    match lst with
    | [] -> funct
    | (a, b)::t -> polynomial_helper t (fun x -> funct x + a * pow x b);;

let polynomial lst = 
    polynomial_helper lst (fun x -> 0);;

(** let f = polynomial [3, 3; -2, 1; 5, 0];; f 2;;*)


(**#10*)
let rec powerset lst = 

(** powerset [3; 4; 10];;*)
