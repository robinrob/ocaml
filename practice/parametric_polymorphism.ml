#!/usr/bin/env ocaml


(* Here the type cannot be inferred automatically, so the function represents an example
 * of parametric polymorphism: *)

let first_if_true test x y =
  if test x then x else y
;;


