#!/usr/bin/env ocaml
#!/usr/bin/env ocaml

#use "topfind"

#thread
#require "core"
#require "ppx_jane"
open Core
open Core.Sexp


exception Key_not_found of string
exception Wrong_date of Date.t with sexp

let _ =
    let divison_by_zero_exception divisors = 
        List.map ~f:(fun x -> 100 / x) divisors ;
    in

    let custom_exception doit = 
        if doit then begin
            raise (Key_not_found "mate") ;
        end
    in

    (* divison_by_zero_exception [1;3;0;4] ;
    custom_exception true ; *)

    let exceptions = [ Not_found; Division_by_zero; Key_not_found "mate" ] in
    
    let filtered_exceptions = List.filter exceptions ~f:(function
        | Key_not_found _ | Not_found -> true
        | _ -> false)
    in

    (* Core.List.iter filtered_exceptions ~f:(fun e -> raise e) ; *)

    let rec find_exn alist key =
        match alist with
            | [] -> raise (Key_not_found key)
            | (key',data) :: tl -> if key = key' then data else find_exn tl key
    in

    let alist = [("a", 1); ("b", 2)] in

    Printf.printf "value: %d
" (find_exn alist "a" ) ;
    (* find_exn alist "c" ; *)

    Wrong_date (Date.of_string "2011-02-23") ;
