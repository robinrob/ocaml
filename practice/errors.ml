#!/usr/bin/env ocaml


#use "topfind"
#thread
#require "core"
open Core


let _ =
    (* Receiving None is an error because nulls do not exist in OCaml. Therefore optionals are
    a way of encoding errors. *)
    let get_head list =
        match list with
        | [] -> None
        | head::tail -> Some head
    in

    let rec get_last list =
        match list with
        | [] -> None
        | [last] -> Some last
        | head::tail -> get_last tail
    in

    let _compute_bounds ~cmp list =
        let sorted = List.sort ~cmp list in
        match get_head sorted, get_last sorted with
        | None,_ | _, None -> None
        | Some x, Some y -> Some (x,y)
    in

    let cmp x y = if x > y then x else y in

    let compute_bounds list =
        _compute_bounds ~cmp:cmp list
    in

    let get_or_zeroes x =
        match x with
        | Some x -> x
        | None -> (0, 0)
    in

    let print_bounds bounds = 
        let higher, lower = get_or_zeroes bounds in
        Printf.printf "lower: %d\n" lower ;
        Printf.printf "higher: %d\n" higher ;
    in

    print_bounds (compute_bounds [1; 2; 3]) ;
    print_bounds (compute_bounds [1; 2; 3; 10]) ;
    print_bounds (compute_bounds []) ;
    print_bounds (compute_bounds [1]) ;

    let return_ok_mate =
        Ok "Mate"
    in

    match return_ok_mate with
        | Ok message -> Printf.printf "%s\n" message ;
        | Error _ -> Printf.printf "error" ;


    let return_error_mate =
        Error "You hav'ny read the highway code"
    in

    match return_error_mate with
        | Error message -> Printf.printf "%s\n" message ;
        | Ok _ -> Printf.printf "actually ok" ;