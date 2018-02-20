#!/usr/bin/env ocaml

let first_if_true test x y = if test x then x else y in

    let res = first_if_true true 2 10;

    (* let am_i_true = () -> true; *)

    Printf.printf "res: %b\n" res ;