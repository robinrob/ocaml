#!/usr/bin/env ocaml

let _ =
    let true_or_false bool =
        if bool then Printf.printf "TRUE\n" else Printf.printf "FALSE\n"
    in
    true_or_false true ;
    true_or_false false ;

    let if_true bool = 
        if bool then Printf.printf "TRUE\n"
    in
    if_true true ;
    if_true false ;

    (* This is how to do a multi-line if-statement !!! *)
    if true
    then begin
        Printf.printf "BLAH\n" ;
    end

    (* Or: *)
    if true
    then
        Printf.printf "BLAH\n" ;
    ;