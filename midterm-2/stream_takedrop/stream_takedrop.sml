(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

fun stream_take(fxs: 'a stream, n: int): 'a stream =
fn() =>
if n <= 0 then strcon_nil
else
case fxs() of
strcon_nil => strcon_nil
|strcon_cons(x1, fxs) => strcon_cons(x1, stream_take(fxs, n - 1))


(* ****** ****** *)


(* ****** ****** *)
    
fun stream_drop(fxs: 'a stream, n: int): 'a stream =
fn()=>
if n <= 0 then 
case fxs() of
strcon_nil => strcon_nil
|strcon_cons(x1, fxs) => strcon_cons(x1, fxs)
  else
    case fxs() of
      strcon_nil => strcon_nil  
      | strcon_cons(x1, fx) => stream_drop(fx, n - 1)()
(* ****** ****** *)

(* end of [CS320-2023-Spring-stream_takedrop.sml] *)