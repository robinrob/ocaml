#!/usr/bin/env ocaml


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
                if current < (Array.length arr)
                then (
                    Printf.printf "el: %d\n" arr.(current) ;
                    _print_arr_2 (current+1) last
                )
        in
        _print_arr_2 0 (Array.length arr)
    in

    let print_arr_3 _arr =
        let rec _print_arr_3 arr current =
            match arr with
                | [| |] -> ()
                | arr ->
                Printf.printf "el: %d\n" arr.(current) ;
                if current < (Array.length _arr -1)
                then
                    _print_arr_3 arr (current+1)
        in
        _print_arr_3 _arr 0
    in
    
    Printf.printf "FIRST_ELEMENT\n" ;
    first_element [||] ;
    first_element [|1|] ;
    first_element [|1; 2|] ;

    Printf.printf "PRINT_ARR\n" ;
    print_arr [||] ;
    print_arr [|1|] ;
    print_arr [|1; 2|] ;
    print_arr [|1; 2; 3; 4; 5|] ;

    Printf.printf "PRINT_ARR_2\n" ;
    print_arr_2 [||] ; 
    print_arr_2 [|1|] ; 
    print_arr_2 [|1; 2|] ;
    print_arr_2 [|1; 2; 3; 4; 5|] ;

    Printf.printf "PRINT_ARR_3\n" ;
    print_arr_3 [||] ; 
    print_arr_3 [|1|] ; 
    print_arr_3 [|1; 2|] ;
    print_arr_3 [|1; 2; 3; 4; 5|] ;
