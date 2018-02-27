#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ =
    let print_int x = Printf.printf " %d" x in

    let rec print_list_d = function
        | [] -> ()
        | first::rest -> print_int first ; print_list_d rest in

    let pretty_print data printer = 
        Printf.printf "[" ;
        printer data ;
        Printf.printf " ]\n"
    in

    let pretty_print_list data =
        pretty_print data print_list_d
    in


    let pretty_print_arr arr =
        Printf.printf "[" ;
        Core.Array.iter arr (fun el -> Printf.printf " %d" el ) ;
        Printf.printf " ]\n" ;
    in

    pretty_print_list [1; 2; 3] ;
    pretty_print_arr [|1; 2; 3|] ;