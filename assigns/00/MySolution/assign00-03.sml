(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

(*
fun
int2str
(x: int): string =
raise MyNotImplementedExn
*)

fun
int2str
(x: int): string =
if x < 10
then
String.str( Char.chr(48+x mod 10))
else(*recursion*)
int2str(x div 10) ^ String.str( Char.chr(48+x mod 10))

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-03.sml] *)
