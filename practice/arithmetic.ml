#!/usr/bin/env ocaml

let f =
    Printf.printf "%d\n" (3 + 4);
    Printf.printf "%d\n" (8 / 3);
    Printf.printf "%f\n" (3.5 +. 6.);
    Printf.printf "%d\n" (30_000_000 / 300_000);
    Printf.printf "%f\n" (sqrt 9.);
()