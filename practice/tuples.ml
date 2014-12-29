#!/usr/bin/env ocaml

(* Define a tuple *)
let a_tuple = (1,2)

(* Extract values from a tuple using pattern-matching syntax (same syntax as tuple definition!) *)
let (x, y) = a_tuple

Print.print x
