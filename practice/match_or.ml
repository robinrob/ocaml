#!/usr/bin/env ocaml



let _ =

    let one_or_two x =
    match x with
    | 1 | 2 -> Printf.printf "ONE OR TWO\n" ;
    | x -> Printf.printf "ANYTHING ELSE\n" ;
    in

    one_or_two 1 ;
    one_or_two 2 ;
    one_or_two 3 ;
