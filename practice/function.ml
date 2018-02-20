#!/usr/bin/env ocaml

(* Definition of a function *)
let square x = x * x ;;

square 2;;

square (square 2);;

(* Ratio function showing type inference *)
let ratio x y =
  Float.of_int x /. Float.of_int y
;;

ratio 4 7;;
