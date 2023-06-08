(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)

(* ****** ****** *)

fun list_tabulate(n: int, f: int -> 'a): 'a list=
    let
      fun helper(i, tester) =
        if i < 0 then tester
        else helper(i-1, f(i)::tester)
    in
      helper(n-1, [])
    end

(* end of [CS320-2023-Sum1-assign02-03.sml] *)
