#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

let _ =
    (* Fold/reduce left association *)
    Printf.printf "%d\n" (Caml.List.fold_left (+) 0 [1;2;3]) ;

    (* Fold/reduce right association *)
    Printf.printf "%d\n" (Caml.List.fold_right (+) [1;2;3] 0) ;

    Printf.printf "%b\n" (Caml.List.fold_right (&&) [true; false] true) ;

    Printf.printf "%b\n" (Caml.List.fold_right (||) [false; true] true) ;
    Printf.printf "%b\n" (Caml.List.fold_left (||) true [false; true]) ;


    let get_or_0 x =
        match x with
        | None -> 0
        | Some x -> x
    in

    (* Reduce is just fold but the accumulator starting value is just the first element in the list.
    However this makes the return type optional. *)
    Printf.printf "%d\n" (get_or_0 (Core.List.reduce [1;2;3] ~f:(+))) ;

    let len_list list = 
        Caml.List.fold_right (fun x sum -> sum + 1) list 0
    in

    Printf.printf "%d\n" (len_list []) ;
    Printf.printf "%d\n" (len_list ["a"; "b"]) ;
    Printf.printf "%d\n" (len_list [1; 2; 3; 4; 5]) ;

    Printf.printf "%d\n" (len_list [1; 2; 3; 4; 5]) ;

    let sum list = Caml.List.fold_right (+) list 0 in
    let map = Caml.List.map in

    (* Summing a matrix is easy with map/sum functions *)
    let sum_matrix matrix = sum (map sum matrix) in

    Printf.printf "%d\n" (sum_matrix [[1; 2; 3]; [4; 5; 6]; [7; 8; 9]]);
