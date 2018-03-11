#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core


let _ =
    let path = "/usr/bin:/usr/local/bin:/bin:/sbin" in

    (* Pipe operator is equivalent to: *)
    (* let (|>) x f = f x in *)
    
    (* The |> operator can be used to pipe the output of the previous function call into another: *)
    String.split ~on:':' path
    |> List.dedup_and_sort ~compare:String.compare
    |> List.iter ~f:print_endline ;

    Printf.printf "\n" ;

    (* Equivalent of above using normal nesting of calls *)
    List.iter ~f:print_endline (
        List.dedup_and_sort ~compare:String.compare (
            String.split ~on:':' path
        )
    ) ;

    Printf.printf "\n" ;

    4 |> Printf.printf "%d\n" ;

    Printf.printf "\n" ;

    (* You can define a right-associative pipe operator *)
    let (^>) f x = f x in

    Printf.printf "%d\n" ^> 4 ;

    Printf.printf "\n" ;

    (* Example above using right-associative pipe operator *)
    List.iter ~f:print_endline
    ^> List.dedup_and_sort ~compare:String.compare
    ^> String.split ~on:':' path ;