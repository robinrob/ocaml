#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ = 
    (* Some printing functions *)
    let print_int x = Printf.printf "list (int): %d\n" x in

    let rec print_list_d = function
    | [] -> ()
    | e::l -> print_int e ; print_list_d l in

    (* Wrong way to create lists, but reason for error is not obvious *)
    let nums = [1, 2, 3, 4, 5] in
        Printf.printf "nums:\n";
        print_list_d nums