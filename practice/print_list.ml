#!/usr/bin/env ocaml

let print_str x = Printf.printf "x: %s\n" x ;;

let rec print_list_s = function
    | [] -> ()
    | e::l -> print_str e ; print_list_s l ;;

print_list_s ["Robin"; "Smith"] ;;