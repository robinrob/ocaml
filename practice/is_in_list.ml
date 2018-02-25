#!/usr/bin/env ocaml

<<<<<<< HEAD
#use "topfind"
#thread
#require "core"
open Core
=======
(* #use "topfind"
#thread
#require "core"
open Core *)
>>>>>>> bb18a1c3b84f959d23687f5d9e161e817d4b1dd5

let _ = 
    (* Standard library *)
    let in_mem = (Caml.List.mem 1 [1;2;3]) in
    Printf.printf "in_mem: %b\n" in_mem ;

<<<<<<< HEAD
    let exists = (Caml.List.exists (fun el -> el = 1) [1;2;3]) in
    Printf.printf "exists: %b\n" exists ;

    (* Use this ordering when using Core module ... *)
    let exists = (Core.List.exists [1;2;3] (fun el -> el = 1)) in
    Printf.printf "exists: %b\n" exists ;

    
=======
    (* Use this ordering when using Core module ... *)
    (* let exists = (List.exists [1;2;3] (fun el -> el = 1)) in
    Printf.printf "exists: %b\n" exists *)

    let exists = (List.exists (fun el -> el = 1) [1;2;3]) in
    Printf.printf "exists: %b\n" exists
>>>>>>> bb18a1c3b84f959d23687f5d9e161e817d4b1dd5
