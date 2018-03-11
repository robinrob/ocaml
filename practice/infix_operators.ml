#!/usr/bin/env ocaml


let _ =
    (* Infix operators like + only differ syntactically from other functions *)

    Printf.printf "%d\n" ((+) 3 4) ;

    (* Partially-applied *)
    let add_to_3 = (+) 3 in
    Printf.printf "%d\n" (add_to_3 4) ;
    Printf.printf "%d\n" (add_to_3 7) ;

    Printf.printf "%d\n" (2 + 10) ;

    (* You can redefine default infix operators! *)
    let (+) x y = x - y in

    Printf.printf "%d\n" (3 + 4) ;


    (*
        A function is treated syntactically as an operator if the name of that function is chosen from one of a specialized set of identifiers.
        This set includes identifiers that are sequences of characters from the following set:
        ! $ % & * + - . / : < = > ? @ ^ | ~
    *)

    let (+-) x y =
        x * y
    in

    Printf.printf "%d\n" (3 +- 4) ;

    (* To pass a negative number literal to a function, it must be wrapped in parentheses! *)
    Printf.printf "%d\n" (max 3 (-4)) ;