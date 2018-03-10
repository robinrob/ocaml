#!/usr/bin/env ocaml


let _ = 
    let print_random n =
        let i = ref 0 in
        while !i < n do
            Printf.printf "%d\n" (!i + 1) ;
            i := !i + 1 ;
        done
    in
        print_random 5 ;
    
