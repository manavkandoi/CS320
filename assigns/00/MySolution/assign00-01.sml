(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

(*
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
*)

fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

fun
myloop(x: int): int =
(fact(x); myloop(x+1)) handle Overflow => x

(* ****** ****** *)

val myans = myloop(0)
<<<<<<< HEAD

=======
>>>>>>> 31e210ca6c25465c8f1e71a4c49196e369f3bcd2
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-01.sml] *)
