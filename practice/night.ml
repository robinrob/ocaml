#!/usr/bin/env ocaml

(* Goodnight ... *)
let rec night nite =
    match nite with
    | "night" -> Printf.printf "%s\n" nite; night "night"
in

night "night"
