#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ = 
    let range n = 
        let rec add_nums i n acc =
            if i <= 0
            then acc
            else (add_nums (i-1) n ((i) :: acc))
        in
            add_nums n n [] in


    let print_int x = Printf.printf " %d" x in
    
    let pretty_prent_list list =
        let rec print_list_d = function
        | [] -> ()
        | e::l -> print_int e ; print_list_d l in

        Printf.printf "[" ;
        print_list_d list ;
        Printf.printf " ]\n" ;
        in

    pretty_prent_list (range 5) ;

    let range_head n = 
        let rec add_nums i n acc =
            if i <= 0
            then acc
            else
                i :: (add_nums (i-1) n acc) ;
        in
            add_nums n n [] in
            pretty_prent_list (range_head 5) ;