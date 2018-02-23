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