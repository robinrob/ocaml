#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ = 
    (* Some printing functions *)
    let print_str x = Printf.printf "el (str): %s\n" x in
    let print_int x = Printf.printf "el (int): %d\n" x in

    let rec print_list_s = function
    | [] -> ()
    | e::l -> print_str e ; print_list_s l in

    let rec print_list_d = function
    | [] -> ()
    | e::l -> print_int e ; print_list_d l in

    (* List examples *)

    (* Creation (string) *)
    let languages = ["OCaml"; "Perl"; "C"] in
    print_list_s languages ;

    Printf.printf "length\n" ;
    let len = List.length languages in
    Printf.printf "len: %d\n" len ;

    Printf.printf "creation (int)\n" ;
    let nums = [1; 2; 3; 4; 5] in
    Printf.printf "nums:\n" ;
    print_list_d nums ;

    (* Map and iter.
    The function passed to List.map is passed under a labeled argument ~f.
    *)
    Printf.printf "map:\n" ;
    let lens = Core.List.map languages ~f:String.length in
    print_list_d lens ;

    Printf.printf "iter:\n" ;
    Core.List.iter [3; 2; 1] print_int ;

    Printf.printf "appending\n" ;
    let languages = "Ruby" :: "Python" :: languages ; in
    print_list_s languages ;

    Printf.printf "concatenation\n" ;
    let names = ["Robin"] @ ["Andrew"; "Smith"] in
        print_list_s names ;

    Printf.printf "List.hd: %d\n" (match (List.hd [1; 2; 3]) with Some x -> x | None -> 0) ;
    Printf.printf "List.last: %d\n" (match (List.last [1; 2; 3]) with Some x -> x | None -> 0) ;
    print_list_d (match (List.tl [1; 2; 3]) with Some x -> x | None -> []) ;