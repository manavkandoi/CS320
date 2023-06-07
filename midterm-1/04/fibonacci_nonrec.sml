(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-06: 10 points
Fibonacci numbers can be recursively
defined as follows:
fun fibonacci(x: int): int =
  if x >= 2
  then fibonacci(x-2)+fibonacci(x-1) else x
Please use int1_foldleft to implement the
function fibonacci WITHOUT using recursion.
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is disqualified.
*)
(*
fun fibonacci_nonrec(x: int): int = ...
1,2,3,4,5
5,4,3,2,1
4,3,2,1,
*)

(* ****** ****** *)

(* ****** ****** *)
fun fibonacci_nonrec( x: int): int =
  let
    val fibonacci_helper = fn (acc: int * int, x: int) => (#1 acc + #2 acc, #1 acc)
    val (_, result) = int1_foldleft (list_fromto(0, x-1), 1, fibonacci_helper)
  in
    result
  end
(* ****** ****** *)

(* ****** ****** *)



(* ****** ****** *)

(*




(*
fun fibonacci(x: int): int =
  let
    val fibonacci_helper = fn (acc: int * int, x: int) => (#1 acc + #2 acc, #1 acc)
    val (_, result) = int1_foldleft (list_fromto(0, x-1), 1, fibonacci_helper)
  in
    result
  end
*)


(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-fibonacci.sml] *)
