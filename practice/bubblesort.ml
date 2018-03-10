#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

#require "pretty_print"


let _ =
    (* Imperative bubblesort using refs *)
    let bubblesort arr =
        let iter1 i el =
            let iter2 j el =
                if (!j > !i) then begin
                    if arr.(!i) > arr.(!j) then begin
                        let arri = arr.(!i) in
                        arr.(!i) <- arr.(!j) ;
                        arr.(!j) <- arri ;
                    end ;
                    j := !j - 1 ;
                end
            in
            let j = ref ((Array.length arr) - 1) in Core.Array.iter arr (iter2 j) ;
            i := !i + 1 ;
        in
        let i = ref 0 in Core.Array.iter arr (iter1 i) ;

        arr
    in

    (* let pretty_print_arr arr =
        Printf.printf "[" ;
        Core.Array.iter arr (fun el -> Printf.printf " %d" el ) ;
        Printf.printf " ]\n" ;
    in *)

    pretty_print_arr (bubblesort [|1; 2; 3; 4; 5|]) ;
    pretty_print_arr (bubblesort [|5; 4; 3; 2; 1|]) ;
    pretty_print_arr (bubblesort [|5; 2; 4; 3; 1|]) ;