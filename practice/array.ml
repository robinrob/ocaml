#!/usr/bin/env ocaml


#use "topfind"
#thread
#require "core"
open Core

let _ =
    let num_els = function
        | [| |] -> Printf.printf "EMPTY\n" 
        | [| _ |] -> Printf.printf "ONE\n"
        | [| _; _ |] -> Printf.printf "TWO\n"
        | _ -> Printf.printf "MANY\n"
    in
    num_els [||] ;
    num_els [|1|] ;
    num_els [|1; 2|] ;
    num_els [|1; 2; 3|] ;

    let first_element = function
        | [| |] -> Printf.printf "EMPTY\n" 
        | [|first|] -> Printf.printf "first: %d\n" first  
        | arr -> Printf.printf "first: %d\n" arr.(1)
    in

    let rec print_arr = function
        | [| |] -> ()
        | arr -> Printf.printf "el: %d\n" arr.(0) ; print_arr (Array.sub arr 1 (Array.length arr - 1)) ;
    in

    let print_arr_2 arr =
        let rec _print_arr_2 current last = 
            match current with
                | num ->
                if current < (Core.Array.length arr)
                then (
                    Printf.printf "el: %d\n" arr.(current) ;
                    _print_arr_2 (current+1) last
                )
        in
        _print_arr_2 0 (Core.Array.length arr)
    in

    let print_arr_3 _arr =
        let rec _print_arr_3 arr current =
            match arr with
                | [| |] -> ()
                | arr ->
                Printf.printf "el: %d\n" arr.(current) ;
                if current < (Core.Array.length _arr -1)
                then
                    _print_arr_3 arr (current+1)
        in
        _print_arr_3 _arr 0
    in

    let print_arr_4 arr =
        Caml.Array.iter (fun el -> Printf.printf "el: %d\n" el ) arr
    in

    let print_arr_5 arr =
        Core.Array.iter arr (fun el -> Printf.printf "el: %d\n" el )
    in
    
    Printf.printf "FIRST_ELEMENT\n" ;
    first_element [||] ;
    first_element [|1|] ;
    first_element [|1; 2|] ;

    let test_printer printer =
        printer [||] ;
        printer [|1|] ;
        printer [|1; 2|] ;
        printer [|1; 2; 3; 4; 5|] ;
    in

    Printf.printf "PRINT_ARR\n" ;
    test_printer print_arr ;

    Printf.printf "PRINT_ARR_2\n" ;
    test_printer print_arr_2 ;

    Printf.printf "PRINT_ARR_3\n" ;
    test_printer print_arr_3 ;

    Printf.printf "PRINT_ARR_4\n" ;
    test_printer print_arr_4 ;

    Printf.printf "PRINT_ARR_5\n" ;
    test_printer print_arr_5 ;