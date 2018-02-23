#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ =
    let ratio x y =
        Float.of_int x /. Float.of_int y in

        let res = ratio 2 3 in
            Printf.printf "res: %f" res;
()