(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-06: 10 points
Please use int1_foldleft to implement
the following functions list_factorials
which, when applied to an integer n, returns
a list consisting the first n factorial numbers.
For instance, we have
list_factorials(0) = []
list_factorials(5) = [1, 1, 2, 6, 24]
list_factorials(6) = [1, 1, 2, 6, 24, 120]
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is disqualified.
*)
(*
val
int1_foldleft =
fn(xs,r0,fopr) =>
foreach_to_foldleft(int1_foreach)(xs,r0,fopr)
*)

fun list_factorials(n: int): int list =
  let
    val fopr = fn (x: int, r: int list) => (x * hd(r)) :: r
  in
    list_foldl(list_fromto(1, n), [1], fopr)
  end

(* ****** ****** *)
(* ****** ****** *)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_factorials.sml] *)
