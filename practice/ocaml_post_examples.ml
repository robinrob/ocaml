#!/usr/bin/env ocaml

(* Used in: https://rsmith.io/blog/getting-started-with-ocaml *)

let hello_world =
    Printf.printf "Hello World!\n"


let variables_1 =
    let age = 30 in
    Printf.printf "age: %d\n" age


let variables_2 =
    let age = 30 in (
        Printf.printf "age: %d\n" age ;
        let age = 31 in (
            Printf.printf "age: %d\n" age ;
        )
    )

