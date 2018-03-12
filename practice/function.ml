#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

let _ = 
  (* Definition of a function *)
  let square x = x * x in

  let res = square 2 in
  Printf.printf "res: %d\n" res ;

  let res = square (square 2) in
  Printf.printf "res: %d\n" res ;

  (* Ratio function showing type inference *)
  let ratio x y =
    Float.of_int x /. Float.of_int y in

  let res = ratio 4 7 in
  Printf.printf "res: %f\n" res ;

  let is_gt_5 x = x > 5 in
  let res = is_gt_5 4 in

  Printf.printf "res: %b\n" res ; 


  (* Functions declared with 'function' come with built-in Gttern matching syntactical sugar *)
  let func = function
    | 1 -> 2
    | x -> 3
  in

  Printf.printf "%d\n" (func 1) ;
  Printf.printf "%d\n" (func 10) ;

  (* Above is equivalent to: *)
  let func_with_match x = 
    match x with
    | 1 -> 2
    | x -> 3
  in

  Printf.printf "%d\n" (func_with_match 1) ;
  Printf.printf "%d\n" (func_with_match 10) ;

  (* You can match on two arguments by matching on a tuple constructed with them: *)
  let func_with_2_match x y = 
    match x, y with
    | 1, 2 -> 2, 3
    | x, y -> 4, 5
  in

  let x, y = (func_with_2_match 1 2) in
  Printf.printf "%d %d\n" x y ;

  let x, y = (func_with_2_match 1 10) in
  Printf.printf "%d %d\n" x y ;

