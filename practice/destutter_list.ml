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

    let destutter_list_sean list =
        let rec _destutter_list list previous =
            match list with
            | [] -> list
            | h::t -> 
                let replacement =
                match previous with
                | None -> [h]
                | Some previous_item -> if h = previous_item then [] else [h]
                in
                    replacement @ _destutter_list t (Some h) ;
        in
        _destutter_list list None ;
    in
    
    let test_destutter destutterer list expected =
        Printf.printf "list: " ;
        pretty_prent_list list ;
        Printf.printf "expected: " ;
        pretty_prent_list expected ;
        let actual = destutterer list in
        Printf.printf "actual: " ;
        pretty_prent_list actual ;
        let res = (expected = actual) in
        if res then Printf.printf "PASS\n" else Printf.printf "TEST ASSERTION ERROR\n" ;
        assert(res)
    in

    let test_sean list expected =
        test_destutter destutter_list_sean list expected
    in

    let test_robin list expected = 
        test_destutter destutter_list list expected
    in

    let test list expected =
        Printf.printf "TESTING ROBIN\n" ;
        test_robin list expected ;

        Printf.printf "TESTING SEAN\n" ;
        test_sean list expected ;
    in
        
    test [1] [1] ;
    test [1; 1] [1] ;
    test [1; 1; 1] [1] ;
    test [1; 2; 3] [1; 2; 3] ;
    test [1; 1; 2; 2; 1; 1] [1; 2; 1] ;
    test 
        [1; 1; 2; 3; 4; 4; 5; 5; 5; 6; 7; 8; 8; 9]
        [1; 2; 3; 4; 5; 6; 7; 8; 9;]
    ;

    Printf.printf "\n" ;
    let list = [1; 1; 2; 3; 4; 4; 5; 5; 5; 6; 7; 8; 8; 9] in
        pretty_prent_list (destutter_list list);

