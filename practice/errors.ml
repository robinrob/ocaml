#!/usr/bin/env ocaml


#use "topfind"
#thread
#require "core"
#require "ppx_jane"
open Core
open Sexplib.Std


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


    let match_ok  =
        match Ok "Mate" with
            | Ok message -> Printf.printf "%s\n" message ;
            | Error _ -> Printf.printf "error" ;
    in
    match_ok ;


    let match_err = 
        match Error "You hav'ny read the highway code" with
            | Error message -> Printf.printf "%s\n" message ;
            | Ok _ -> Printf.printf "actually ok" ;
    in
    match_err ;

    Printf.printf "%s\n" (Error.to_string_hum (Error.of_string "ERROR GO HOME")) ;

    let err = (Error.create "Something failed a long time ago" Time.epoch Time.sexp_of_t) in
    Printf.printf "%s\n" (Error.to_string_hum err) ;

    Printf.printf "%s\n" (Error.to_string_hum (Error.create "Blah" (3.5, ["a"; "b"; "c"], 6034) [%sexp_of: float * string list * int])) ;

    Printf.printf "%s\n" ([%sexp_of: float * string list * int] (3.5, ["a"; "b"; "c"], 6034) |> Sexp.to_string ) ;

    Printf.printf "%s\n" (Error.to_string_hum (Error.tag
        (Error.of_list [
            Error.of_string "You forgot your driving license";
            Error.of_string "Your tires were slashed"
        ])
        "over the weekend"
    ));

    (* Bind can be used as a way of sequencing together error-producing functions so that the first one to produce an error terminates the computation.
       Compute_bounds can be written more elegantly using bind:
    *)
    let _compute_bounds2 ~cmp list =
        let sorted = List.sort ~cmp list in
        Option.bind (List.hd sorted) (fun first ->
        Option.bind (List.last sorted) (fun last ->
            Some (first,last)))
    in

    let compute_bounds2 list =
        _compute_bounds2 ~cmp:cmp list ;
    in

    print_bounds (compute_bounds [1; 2; 3]) ;
    print_bounds (compute_bounds [1; 2; 3; 10]) ;
    print_bounds (compute_bounds []) ;
    print_bounds (compute_bounds [1]) ;