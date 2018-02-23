#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ = 
    let a_list = ["Hello"; "World"] in
    let print_el el = Printf.printf "el: %s\n" el in
 
    (* Keyword args can be placed anywhere in arg sequence *)
    List.iter ~f:print_el a_list ;
    List.iter a_list ~f:print_el ;
    (* List.iter takes the list first so the function has to be 2nd if not
    specifying the keyword label *)
    List.iter a_list print_el ;