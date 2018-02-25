#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

let _ = 
    let log_entry maybe_time message =
        let time =
            match maybe_time with
            | Some x -> x
            | None -> Time.now ()
        in
        Time.to_string time ^ " -- " ^ message
    in

    let entry = log_entry (Some Time.epoch) "A long long time ago"
    in
        Printf.printf "%s" entry