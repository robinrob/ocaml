#!/usr/bin/env ocaml

let _ =
    let pretty_prent_list_int list =
        let print_int x = Printf.printf " %d;" x in

        let rec print_list_d = function
        | [] -> ()
        | e::l -> print_int e ; print_list_d l in

        Printf.printf "[" ;
        print_list_d list ;
        Printf.printf " ]\n" ;
    in

    let pretty_prent_list_str list =
        let print_int x = Printf.printf " %s;" x in

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
        | first :: second :: rest -> if first = second
        then (destutter_list (first :: rest))
        else (first :: destutter_list (second :: rest))
    in

    let destutter_list_sean list =
        let rec _destutter_list list previous =
            match list with
            | [] -> list
            | head :: rest -> 
            let current = [head] in
            let replacement = if current = previous then [] else [head] in 
            replacement @ _destutter_list rest current ;
        in
        _destutter_list list [] ;
    in
    
    let test_destutter printer destutterer list expected =
        Printf.printf "list: " ;
        printer list ;
        Printf.printf "expected: " ;
        printer expected ;
        let actual = destutterer list in
        Printf.printf "actual: " ;
        printer actual ;
        let res = (expected = actual) in
        if res then Printf.printf "PASS\n" else Printf.printf "TEST ASSERTION ERROR\n" ;
        assert(res)
    in

    let test_sean tester list expected =
        tester destutter_list_sean list expected ;
    in

    let test_robin tester list expected = 
        tester destutter_list list expected ;
    in

    let test printer list expected =
        let tester = test_destutter printer in
            Printf.printf "TESTING ROBIN\n" ;
            test_robin tester list expected ;

            Printf.printf "TESTING SEAN\n" ;
            test_sean tester list expected ;
    in

    let test_int list expected =
        test pretty_prent_list_int list expected ;
    in

    let test_str list expected =
        test pretty_prent_list_str list expected ;
    in

    test_int [1] [1] ;
    test_int [1; 1] [1] ;
    test_int [1; 1; 1] [1] ;
    test_int [1; 2; 3] [1; 2; 3] ;
    test_int [1; 1; 2; 2; 1; 1] [1; 2; 1] ;
    test_int 
        [1; 1; 2; 3; 4; 4; 5; 5; 5; 6; 7; 8; 8; 9]
        [1; 2; 3; 4; 5; 6; 7; 8; 9;]
    ;
    test_str
        ["Robin"; "Robin"; "Andrew"; "Smith"; "Smith"; "Smith"]
        ["Robin"; "Andrew"; "Smith"]
    ;

    Printf.printf "\n" ;
    let list = [1; 1; 2; 3; 4; 4; 5; 5; 5; 6; 7; 8; 8; 9] in
        pretty_prent_list_int (destutter_list list);

