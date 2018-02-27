#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

let _ = 
    (* Standard library *)
    let in_mem = (Caml.List.mem 1 [1;2;3]) in
    Printf.printf "in_mem: %b\n" in_mem ;

    let exists = (Caml.List.exists (fun el -> el = 1) [1;2;3]) in
    Printf.printf "exists: %b\n" exists ;

    let a_list = ["hello"; "world"] in
    let print_el el = Printf.printf "el: %s\n" el in
    Caml.List.iter print_el a_list ;

    (* Jane Street Core *)
    let exists = (Core.List.exists [1;2;3] (fun el -> el = 1)) in
    Printf.printf "exists: %b\n" exists ;

    let in_mem = (Core.List.mem [1;2;3] 1 (fun x y -> x = y)) in
    Printf.printf "in_mem: %b\n" in_mem;

    let in_mem = (Core.List.mem [1;2;3] 0 (=)) in
    Printf.printf "in_mem: %b\n" in_mem;

    Core.List.iter a_list print_el ;
