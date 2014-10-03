#!/usr/bin/env ocaml


(* Function sum_if_true takes function test as an argument *)
let sum_if_true test first second =
    (if test first then first else 0)
    + (if test second then second else 0)
;;


let even x =
  x mod 2 = 0 ;;


sum_if_true even 3 4;;

sum_if_true even 2 4;;
