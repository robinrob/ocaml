#!/usr/bin/env ocaml

 let fac n =
  let rec f i n acc =
    if i >= n
    then acc
    else (Printf.printf "%8d%8d%8d\n" i n acc; f (i+1) n ((i+1)*acc))
  in
    f 0 n 1
  in

  fac 5