#!/usr/bin/env ocaml

let _ = 
    let divide x y =
        if y = 0. then None else Some (x /. y) ;
    in
       
    let ans = divide 2. 3. in
        match ans with
        | Some ans -> Printf.printf "ans: %.2f\n" ans 
        | None -> Printf.printf "ans: None" 