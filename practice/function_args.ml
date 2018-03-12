#!/usr/bin/env ocaml


let _ = 
  (* Function arguments can be referenced using the pattern-matching syntax too: *)
  let distance (x1, y1) (x2, y2) =
    sqrt ((x1 -. x2) ** 2. +. (y1 -. y2) ** 2.)
  in

  Printf.printf "distance: %f\n" (distance (1., 2.) (3., 4.)) ;

  (* Named arguments (combined with destructuring through pattern-matching): *)
  let distance2 ~point1 ~point2 =
    match point1, point2 with
    | (x1, y1), (x2, y2) -> sqrt ((x1 -. x2) ** 2. +. (y1 -. y2) ** 2.)
  in

  Printf.printf "distance: %f\n" (distance2 (1., 2.) (3., 4.)) ;

  (* Named arguments can be partially-applied. Therefore this can be used as a dependency
  injection method. *)
  let add_nums ~x ~y = x + y in

  let add_to_x = add_nums ~x:1 in
  let add_to_y = add_nums ~y:2 in

  Printf.printf "%d\n" (add_to_x 2) ;
  Printf.printf "%d\n" (add_to_y 10) ;

  (* Higher-order functions and labels
  One surprising gotcha with labeled arguments is that while order doesn’t matter when calling a function with labeled arguments,
  it does matter in a higher-order context, e.g., when passing a function with labeled arguments to another function. Here’s an example: *)
  let apply_to_tuple f (first,second) = f ~first ~second in

  (* Here, the definition of apply_to_tuple sets up the expectation that its first argument is a function with two labeled arguments, first and second, listed in that order.
  We could have defined apply_to_tuple differently to change the order in which the labeled arguments were listed: *)
  let apply_to_tuple_2 f (first, second) = f ~second ~first in

  (* It turns out this order matters. In particular, if we define a function that has a different order *)
  let divide ~first ~second = first /. second in

  (* We’ll find that it can’t be passed in to apply_to_tuple_2. *)
  Printf.printf "divide: %F\n" (apply_to_tuple divide (1., 2.)) ;
  (* Fails: *)
  (* Printf.printf "divide: %F\n" (apply_to_tuple_2 divide (1., 2.)) ; *)

  (* NOTE that the above only matters when you aren't labelling the named arguments as you pass them in!
  That seems obvious. Whereas this works: *)
  let apply_to_tuple_3 f (first, second) = f ~first:second ~second:first in
  Printf.printf "divide: %F\n" (apply_to_tuple divide (1., 2.)) ;