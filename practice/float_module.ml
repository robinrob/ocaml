#!/usr/bin/env ocaml

#use "topfind";;
#thread;;
#require "core";;
open Core


let ratio x y =
     Float.of_int x /. Float.of_int y
  ;;


let res = ratio 2 3 in
    Printf.printf "res: %f
" res ;;
