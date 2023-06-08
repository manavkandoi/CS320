(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(* ****** ****** *)

fun list_longest_ascend(xs: int list): int list =
    let
        fun helpermin(xs: int list): int =
            case xs of
            [] => raise Empty
            | [x] => x
            | x::rest =>
                let
                    val min = helpermin rest
                in
                    if x < min then x else min
                end

        fun helper(xs: int list, prev: int): int list =
            
            case xs of
                [] => []
            |x::xs => if (x >= prev) then
                let

                    val to_keep = x :: helper(xs, x)
                    val to_drop = helper(xs, prev)

                in
                    if list_length(to_keep)>=list_length(to_drop) then to_keep 
                    else to_drop
                end
                    else helper(xs, prev)

    in
    
        if xs = [] then []
        else helper(xs, helpermin(xs))
    end


(* end of [CS320-2023-Sum1-assign02-04.sml] *)
