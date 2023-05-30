(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun myloop(cs: string, x: int): string =
    if x > 0 then  String.str(String.sub(cs, x - 1)) ^ myloop(cs, x - 1)
    else ""

fun stringrev(cs: string): string =
    let
        val strlen = String.size cs
    in
        myloop(cs, strlen)
    end
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-05.sml] *)
