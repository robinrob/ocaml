#!/usr/bin/env ocaml


(* Function arguments can be referenced using the pattern-matching syntax too: *)
let distance (x1,y1) (x2,y2) =
  sqrt ((x1 -. x2) ** 2. +. (y1 -. y2) ** 2.)