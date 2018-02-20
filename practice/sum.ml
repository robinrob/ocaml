#!/usr/bin/env ocaml

let rec sum list =
    match list with
    | [] -> 0
    | first :: rest -> first + sum rest
;;

let ans = sum [1; 2; 3; 4] ;;
Printf.printf "ans: %d\n" ans ;;

assert( ans = 10 ) ;