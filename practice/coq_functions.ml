#!/usr/bin/env ocaml

let int_natlike_rec = fun fO fS ->
 let rec loop acc i = if i <= 0 then acc else loop (fS acc) (i-1)
 in loop fO;;

(** val nat_of_int : int -> nat **)

let nat_of_int = int_natlike_rec O (fun x -> S x);;

(** type nat_of_int =
  | O
  | S of nat_of_int;;

(** val plus : nat_of_int -> nat_of_int -> nat_of_int **)

let rec plus n m =
  match n with
    | O -> m
    | S p -> S (plus p m);;

(** val mult : nat_of_int -> nat_of_int -> nat_of_int **)

let rec mult n m =
  match n with
    | O -> O
    | S p -> plus m (mult p m);;

(** val f1 : nat_of_int -> nat_of_int **)


let f1 i =
  let sum = plus i (S i) in mult i (mult sum sum);;
  
**)

nat_of_int 1;;
