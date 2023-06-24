(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_take(fxs, n) = ...
*)

fun stream_take(fxs: 'a stream, n: int): 'a stream =
fn() =>
if n <= 0 then strcon_nil
else
case fxs() of
strcon_nil => strcon_nil
|strcon_cons(x1, fxs) => strcon_cons(x1, stream_take(fxs, n - 1))


(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_take.sml] *)
