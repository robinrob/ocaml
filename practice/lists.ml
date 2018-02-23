#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ = 
    let print_str x = Printf.printf "list (str): %s\n" x in
    let print_int x = Printf.printf "list (int): %d\n" x in

    let rec print_list_s = function
    | [] -> ()
    | e::l -> print_str e ; print_list_s l in

    let rec print_list_d = function
    | [] -> ()
    | e::l -> print_int e ; print_list_d l in

    let languages = ["OCaml";"Perl";"C"] in
    print_list_s languages ;

    let len = List.length languages in
    Printf.printf "len: %d\n" len ;

    (* The function passed to List.map is passed under a labeled argument ~f *)
    let lens = List.map languages ~f:String.length in

    print_list_d lens ;

    let languages = "Ruby" :: "Python" :: languages ; in
    print_list_s languages ;