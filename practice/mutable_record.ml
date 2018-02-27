#!/usr/bin/env ocaml


type running_sum = {
    mutable sum: float;
    mutable sum_sq: float; (* sum of squares *)
    mutable samples: int;
}

let _ =
    let print_running_sum rsum =
        Printf.printf "rsum.sum: %f\n" rsum.sum ;
        Printf.printf "rsum.sum_sq: %f\n" rsum.sum_sq ;
        Printf.printf "rsum.samples: %d\n" rsum.samples ;
    in
    
    let mean rsum = rsum.sum /. float rsum.samples in

    let stdev rsum = sqrt (
        (rsum.sum_sq /. float rsum.samples)
        -. ((mean rsum) ** 2.)
    ) in

    let create_running_sum = { sum = 0.; sum_sq = 0.; samples = 0; } in

    let update_running_sum rsum x = 
        rsum.samples <- (rsum.samples + 1) ;
        rsum.sum <- rsum.sum +. x ;
        rsum.sum_sq <- rsum.sum_sq +. (x ** 2.) ;
    in

    let do_it rsum num = 
        Printf.printf "num: %f\n" num ;
        update_running_sum rsum num ;
        print_running_sum rsum ;
        Printf.printf "mean: %f\n" (mean rsum);
        Printf.printf "standard_deviation: %f\n" (stdev rsum);
        Printf.printf "\n" ;
    in
    
    let nums = [1.2; 2.3; 3.4; 5.6; 6.7] ; in
    let the_running_sum = create_running_sum in
    List.iter (fun num -> do_it the_running_sum num) nums ;