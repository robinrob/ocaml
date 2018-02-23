#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ = 
    let a_list = ["hello"; "world"] in
    let print_el el = Printf.printf "el: %s\n" el in
 
    (* *)
    List.iter a_list print_el ;