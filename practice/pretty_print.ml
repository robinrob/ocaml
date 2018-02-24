#!/usr/bin/env ocaml

let print_int x = Printf.printf " %d" x in

let rec print_list_d = function
    | [] -> ()
    | e::l -> print_int e ; print_list_d l in

let pretty_prent_list list =
    Printf.printf "[" ;
    print_list_d list ;
    Printf.printf " ]" ;