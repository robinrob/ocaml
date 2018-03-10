#!/usr/bin/env ocaml



let _ =
    let if_one =
        Printf.printf "if_one!\n" ;
        false ;
    in

    let if_two x =
        Printf.printf "if_two!\n" ;
        true ;
    in

    if if_one && if_two 1
    then
        Printf.printf "TRUE\n" ;
    ;

    let bool = false in
    let arr = [|true|] in

    if bool && arr.(5)
    then
        Printf.printf "TRUE\n" ;
    ;

    let if_one_func = function
    | _ -> Printf.printf "if_one_func!\n"; false
    in

    let if_two_func = function
    | _ -> Printf.printf "if_two_func!\n"; true
    in
    
    (if_one_func 1) && (if_two_func 1) ;

    let if_one_fun = fun x -> Printf.printf "if_one_fun!\n"; false in
    let if_two_fun = fun x -> Printf.printf "if_two_fun!\n"; true in
        (if_one_fun 1) && (if_two_fun 1) ;


    let f a = (Printf.printf "😂\n";) in
        f 1;