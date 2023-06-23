(* ****** ****** *)

use
"./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// a stream fxs of integers and returns a stream consisting
// of all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)
(*
fun
stream_drawdowns(fxs) =
let
  fun
  helper
  (x0: int, fxs, res): (int list) strcon =
  let
    val
    strcon_cons(x1, fxs) = fxs()
  in
    if x0 >= x1
    then helper(x0, fxs, x1 :: res)
    else
    strcon_cons
    (x0 :: list_reverse(res), fn() => helper(x1, fxs, []))
  end
in
  fn () =>
  let
    val strcon_cons(x0, fxs) = fxs() in helper(x0, fxs, [])
  end
end
*)

fun stream_drawdowns(fxs: int stream): int list stream =
let
    fun compute_drawdowns(fxs: int stream, FirstValue: int): int list stream=
    fn() =>
    case fxs() of
    strcon_nil => strcon_nil
    |strcon_cons(x1, fxs) => 
        let
            fun drawdowns(fxs) : int list = 
                case fxs() of
                    strcon_nil => []
                    |strcon_cons(x1, fxs') => 
                        if x1 <= FirstValue then [x1] @ drawdowns(fxs') else []
        in
            
            strcon_cons(drawdowns(fxs), compute_drawdowns(fxs, stream_head(fxs)))
        end
in
    compute_drawdowns(fxs, stream_head(fxs))
end

  
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-stream_drawdowns.sml] *)
