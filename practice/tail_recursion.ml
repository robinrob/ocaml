#!/usr/bin/env ocaml

 let fac n =
  let rec f i n acc =
    if i >= n
    then acc
    else (Printf.printf "%8d%8d%8d\n" i n acc; f (i+1) n ((i+1)*acc))
  in
    f 0 n 1;;
val fac : int -> int = <fun>
# fac 5;;
       0       5       1
       1       5       1
       2       5       2
       3       5       6
       4       5      24
- : int = 120
