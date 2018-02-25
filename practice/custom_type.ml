#!/usr/bin/env ocaml

#use "topfind"
#thread
#require "core"
open Core

type point_desc = { x : float; y : float }
type circle_desc  = { center: point_desc; radius: float }
type rect_desc    = { lower_left: point_desc; width: float; height: float }
type line_desc = { point1: point_desc; point2: point_desc }
(* Variant type - can be any of these types *)
type scene_element =
    | Circle  of circle_desc
    | Rect    of rect_desc
    | Line of line_desc

let _ =
    (* The attributes of a type can be accessed by pattern-matching on the function argument: *)
    let magnitude { x = x_pos; y = y_pos } =
        sqrt (x_pos ** 2. +. y_pos ** 2.)
    in

    let point = { x = 3.; y = 4.} in
    let mag = magnitude point in
    Printf.printf "mag: %.2f\n" mag ;

    (* Attributes of a type can also just be accessed more implicitly: *)
    let distance p1 p2 =
        magnitude { x = p1.x -. p2.x; y = p1.y -. p2.y }
    in
    
    let dis = distance point point in
        Printf.printf "dis: %f\n" dis ;

    let point2 = { x = 5.; y = 10. } in
    let dis = distance point point2 in
        Printf.printf "dis: %f\n" dis ;


    let circle1 = { center = point; radius = 10. } in

    let area_of_circle circle =
        Float.pi /. 2. *. circle.radius ** 2.
    in

    let area = area_of_circle circle1 in
        Printf.printf "area: %f\n" area ;

    let perimiter_of_circle circle =
        2. *. Float.pi *. circle.radius
    in

    let perim = perimiter_of_circle circle1 in
        Printf.printf "perim: %f\n" perim ;


    let is_inside_scene_element point scene_element =
        match scene_element with
            | Circle { center; radius } -> distance center point < radius
            | Rect { lower_left; width; height } ->
                point.x    > lower_left.x && point.x < lower_left.x +. width
                && point.y > lower_left.y && point.y < lower_left.y +. height
            | Line { point1; point2 } -> false
     in

     let is_inside_scene point scene =
        List.exists scene
        ~f:(fun el -> is_inside_scene_element point el)
    in
    let is_inside = is_inside_scene {x=3.;y=7.} [ Circle {center = {x=4.;y= 4.}; radius = 5.0 } ] in
    Printf.printf "is_inside: %b\n" is_inside ;
