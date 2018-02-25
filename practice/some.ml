#!/usr/bin/env ocaml

let _ =
    let check_optional x =
        match x with
        | Some x -> Printf.printf "Some(%d) !\n" x
        | None -> Printf.printf "x is None!\n"
    in
    check_optional (Some 2) ;
    check_optional None ;

    let pretty_prent_list_int list =
        let print_int x = Printf.printf " %d;" x in

        let rec print_list_d = function
        | [] -> ()
        | e::l -> match e with
            | (Some e) -> print_int e ; print_list_d l
            | None -> Printf.printf " None;" ; print_list_d l
        in

        Printf.printf "[" ;
        print_list_d list ;
        Printf.printf " ]\n" ;
    in
    pretty_prent_list_int [Some 1; Some 2; None; Some 4] ; 