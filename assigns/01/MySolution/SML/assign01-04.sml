(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)
fun str2int_opt (cs : string): int option =
  let
    fun checkNum (str: string, i: int): bool =
      if i >= String.size(str) then true
      else if ord(String.sub(str, i)) - ord(#"0") >= 0 andalso ord(String.sub(str, i)) - ord(#"0") <= 9 then checkNum(str, i+1)
      else false

    fun convert (i: int,k: int): int option =
      if i = String.size(cs) then SOME(k)
      else if i = 0 then convert(i+1, (ord(String.sub(cs, 0)) - ord(#"0")))
      else convert(i+1, 10*k + (ord(String.sub(cs, i)) - ord(#"0")))
  in
    if cs = "" orelse checkNum(cs, 0) = false then NONE
    else convert(0,0)
  end;
						
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-04.sml] *)
