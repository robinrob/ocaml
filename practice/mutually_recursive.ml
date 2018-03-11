#!/usr/bin/env ocaml


let _ =
    let rec is_even x =
        if x = 0 then true else is_odd (x - 1)
    and is_odd x =
        if x = 0 then false else is_even (x - 1)
    in 

    Printf.printf "%b\n" (is_even 0) ;
    Printf.printf "%b\n" (is_even 1) ;
    Printf.printf "%b\n" (is_odd 0) ;
    Printf.printf "%b\n" (is_odd 1) ;