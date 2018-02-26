#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ =
    let ratio x y =
        Float.of_int x /. Float.of_int y in

        let res = ratio 2 3 in
            Printf.printf "res: %f\n" res;


    (* `float <int>` is a shortcut for `Float.of_int <int>` *)
    let float_from_int = float 123 in
    Printf.printf "float_from_int: %f\n" float_from_int ;
()