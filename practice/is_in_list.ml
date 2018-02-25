#!/usr/bin/env ocaml

(* #use "topfind"
#thread
#require "core"
open Core *)

let _ = 
    let in_mem = (List.mem 1 [1;2;3]) in
    Printf.printf "in_mem: %b\n" in_mem ;

    (* Use this ordering when using Core module ... *)
    (* let exists = (List.exists [1;2;3] (fun el -> el = 1)) in
    Printf.printf "exists: %b\n" exists *)

    let exists = (List.exists (fun el -> el = 1) [1;2;3]) in
    Printf.printf "exists: %b\n" exists
