#!/usr/bin/env ocaml

let is_gt_5 x = x > 5 in
    let res = is_gt_5 4 in
        Printf.printf "res: %b\n" res ;

    let res = is_gt_5 6 in
        Printf.printf "res: %b\n" res ;