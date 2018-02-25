#!/usr/bin/env ocaml

let _ = 
    let in_mem = (List.mem 1 [1;2;3]) in
    Printf.printf "in_mem: %b\n" in_mem ;
