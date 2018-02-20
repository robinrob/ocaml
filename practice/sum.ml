#!/usr/bin/env ocaml

let f = 
    let rec sum list =
        match list with
        | [] -> 0
        | first :: rest -> first + sum rest in

        let ans = sum [1; 2; 3; 4] in
            Printf.printf "ans: %d\n" ans;
            assert( ans = 10 )
        ;

        let ans = sum [1; 2; 3; 4] in
            Printf.printf "ans: %d\n" ans;
            assert( ans = 10 )
        ;

        let ans = sum [1; 2; 3; 4] in
            Printf.printf "ans: %d\n" ans;
            assert( ans = 10 )
        ;
()