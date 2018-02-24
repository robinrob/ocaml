#!/usr/bin/env ocaml

(* The elements of a list can be accessed through pattern matching.
List patterns are based on the two list constructors, [] and ::.
*)

let _ =
    let languages = ["OCaml"; "Ruby"; "Python"] in

    (* This version compiles but generates a compiler warning *)
    let my_favorite_language (my_favorite :: the_rest) =
         my_favorite in
         Printf.printf "my_favorite_language: %s\n" (my_favorite_language languages) ;

         (* And generates an exception when a non-matching value is given! *)
         (* Printf.printf "my_favorite_language: %s\n" (my_favorite_language []) ; *)

    (* This version is complete *)
    let my_favorite_language languages =
        match languages with
        | [] -> "Coq"
        | (first :: the_rest) -> first in
        Printf.printf "my_favorite_language: %s\n" (my_favorite_language languages) ;
        Printf.printf "my_favorite_language: %s\n" (my_favorite_language []) ;
