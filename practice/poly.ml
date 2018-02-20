#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

let add_polynom p1 p2 =
    let n1 = Array.length p1
    and n2 = Array.length p2 in
    let result = Array.create (max n1 n2) 0 in
    for i = 0 to n1 - 1 do result.(i) <- p1.(i) done;
    for i = 0 to n2 - 1 do result.(i) <- result.(i) + p2.(i) done;
    result

let res = add_polynom [| 1; 2 |] [| 1; 2; 3 |]
