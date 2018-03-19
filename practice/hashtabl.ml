#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

let _ =
    (* Guess the initial size of the table - but it will grow if needed *)

    let print_hash hash =
        Caml.Hashtbl.iter (fun key value -> Printf.printf "%s: %s\n" key value) hash
    in

    let my_hash = Caml.Hashtbl.create 123 in

    Caml.Hashtbl.add my_hash "one" "1" ;
    Caml.Hashtbl.add my_hash "two" "2" ;

    print_hash my_hash ;

    let find_mismatches table1 table2 =
        Hashtbl.fold table1 ~init:[] ~f:(fun ~key ~data mismatches ->
            match Hashtbl.find table2 key with
            | Some data' when data' <> data -> key :: mismatches
            | _ -> mismatches
        )
    in

    let my_hash1 = Core.String.Table.create() ~size:4 in
    let _ = Hashtbl.add my_hash1 "one" "1" in
    let _ = Hashtbl.add my_hash1 "two" "2" in

    let my_hash2 = Core.String.Table.create() ~size:4 in
    let _ = Hashtbl.add my_hash2 "one" "blah" in
    let _ = Hashtbl.add my_hash2 "three" "3" in

    let mismatches = find_mismatches my_hash1 my_hash2 in
    List.iter mismatches (fun key -> Printf.printf "mismatch: %s\n" key);