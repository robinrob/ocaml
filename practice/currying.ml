#!/usr/bin/env ocaml


let _ =
    let diff1 x y =
        abs(x - y)
    in
    
    let diff1_from_5 =
        diff1 5
    in

    Printf.printf "res: %d\n" (diff1_from_5 10) ;
    Printf.printf "res: %d\n" (diff1_from_5 2) ;

    let diff2 = fun x -> fun y -> abs (x - y)
    in

    let diff2_from_5 = diff2 5
    in

    Printf.printf "res: %d\n" (diff2_from_5 10) ;
    Printf.printf "res: %d\n" (diff2_from_5 2) ;

    (* Only way to write a multi-arg function that is not curried is to pass the args in a data structure,
    and use pattern-matching to get the args out of the structure *)
    let diff3 (x, y) = abs(x - y)
    in

    Printf.printf "res: %d\n" (diff3 (5, 10)) ;
    Printf.printf "res: %d\n" (diff3 (5, 2)) ;

    let diff4 [|x, y|] = abs(x - y)
    in

    Printf.printf "res: %d\n" (diff4 [|5, 10|]) ;
    Printf.printf "res: %d\n" (diff4 [|5, 2|]) ;