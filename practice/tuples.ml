#!/usr/bin/env ocaml

(* Define a tuple *)
let a_tuple = (1,2) in

(* Extract values from a tuple using pattern-matching syntax (same syntax as tuple definition!) *)
let (x, y) = a_tuple in

Printf.printf "x: %d\n" x ;
Printf.printf "y: %d\n" y ;

(* Using pattern-matching syntax you can assign symbols to elements of input tuples *)
let distance (x1, y1) (x2, y2) =
    sqrt (( x1 -. x2) ** 2. +. (y1 -. y2) ** 2.) in

let res = distance (1., 2.) (4., 5.) in
Printf.printf "res: %f\n" res ;