#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

let _ = 
    let exists = (List.mem [1;2;3] 1) in
    Printf.printf "exists: %b\n"  ;
    (* let exists = (List.mem 0 [1;2;3]) in
    Printf.printf "exists: %b\n" exists ; *)

    (* let exists = (List.exists (fun el -> el = 1) [1;2;3]) in
    Printf.printf "exists: %b\n" exists *)

    let exists = List.exists [1;2;3] ~f:(fun el -> el = 1) in 
    Printf.printf "exists: %b\n" exists 