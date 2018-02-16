#!/usr/bin/env ocaml


(* Function sum_if_true takes function test as an argument *)
let sum_if_true test first second =
    (if test first then first else 0)
    + (if test second then second else 0)
;;


let even x =
  x mod 2 = 0 ;;


let res = sum_if_true even 3 4;;
Printf.printf "res: %d\n%!" res ;;

let res = sum_if_true even 2 4;;
Printf.printf "res: %d\n%!" res ;;

let odd x =
  x mod 2 = 1 ;;


let res = sum_if_true odd 3 4;;
Printf.printf "res: %d\n%!" res ;;

let res = sum_if_true odd 2 4;;
Printf.printf "res: %d\n%!" res ;;