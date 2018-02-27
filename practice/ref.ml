#!/usr/bin/env ocaml


let _ =

    (* A ref effectively allows you to have a mutable variable *)
    let x = ref 0 in
    Printf.printf "!x: %d\n" !x ;

    x := !x + 1 ;
    Printf.printf "!x: %d\n" !x ;

    (* This is totally equivalent to `ref` *)
    let ref x = { contents = x } in
    let (!) r = r.contents in
    let (:=) r x = r.contents <- x in

    let x = ref 0 in
    Printf.printf "!x: %d\n" !x ;

    x := !x + 1 ;
    Printf.printf "!x: %d\n" !x ;

    (* Summing a list imperatively using a ref *)
    let sum list =
        let sum = ref 0 in
        List.iter (fun x -> sum := !sum + x) list;
        !sum ;
    in

    let the_sum = sum [1; 2; 3; 4; 5] in
        Printf.printf "sum: %d\n" the_sum ;

    let sum_arr arr = 
        let sum = ref 0 in
        Array.iter (fun x -> sum := !sum + x) arr;
        !sum ;
    in

    let the_sum = sum_arr [|1; 2; 3; 4; 5|] in
        Printf.printf "sum: %d\n" the_sum ;
