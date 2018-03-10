#!/usr/bin/env ocaml


let _ = 
    let print_random n =
        for i = 0 to n do
            Printf.printf "%d\n" (Random.int 10_000) ;
            Printf.printf "%f\n" (Random.float 10_000.0) ;
        done
    in
        print_random 5 ;
