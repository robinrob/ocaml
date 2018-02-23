#!/usr/bin/env ocaml


(* Here the type cannot be inferred automatically, so the function represents an example
 * of parametric polymorphism: *)


let print_s x = Printf.printf "val: %s\n" x and print_d x = Printf.printf "val: %d\n" x in

let first_if_true test x y =
  if test x then print_s x else print_s y in

let long_string s = String.length s > 6 in
first_if_true long_string "short" "loooooong" ;
first_if_true long_string "robin" "smith" ;

let first_if_true test x y =
  if test x then print_d x else print_d y in

let is_gt_5 x = x > 5 in
first_if_true is_gt_5 5 10 ;
first_if_true is_gt_5 12 4 ;