#!/usr/bin/env ocaml

let _ =
    let pretty_prent_list list =
        let print_int x = Printf.printf " %d;" x in

        let rec print_list_d = function
        | [] -> ()
        | e::l -> print_int e ; print_list_d l in

        Printf.printf "[" ;
        print_list_d list ;
        Printf.printf " ]\n" ;
    in

    let rec destutter_list list =
        match list with
        | [] -> list
        | first :: [] -> list
        | first :: second :: [] -> first :: (if first = second then [] else [second] )
        | first :: second :: rest -> if first = second then (destutter_list (first :: rest)) else (first :: destutter_list (second :: rest))
    in

    let test list expected =
        Printf.printf "expected: " ;
        pretty_prent_list expected ;
        let actual = destutter_list list in
        Printf.printf "actual: " ;
        pretty_prent_list actual ;
        let res = (expected = actual) in
        if res then Printf.printf "PASS\n" else Printf.printf "TEST ASSERTION ERROR\n" ;
        assert(res)
    in
        
    test [1] [1] ;
    test [1; 1] [1] ;
    test [1; 1; 1] [1] ;
    test [1; 2; 3] [1; 2; 3] ;
    test 
        [1; 1; 2; 3; 4; 4; 5; 5; 5; 6; 7; 8; 8; 9]
        [1; 2; 3; 4; 5; 6; 7; 8; 9;]
    ;

    Printf.printf "\n" ;
    let list = [1; 1; 2; 3; 4; 4; 5; 5; 5; 6; 7; 8; 8; 9] in
        pretty_prent_list (destutter_list list);

