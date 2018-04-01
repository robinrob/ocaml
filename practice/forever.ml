#!/usr/bin/env ocaml

let _ =
    (* A recursive function must take an argument - so we pass it a default unit type. *)
    let rec forever () =
        Printf.printf "FOREVER\n" ;
        forever () ;
    in

    forever ();
