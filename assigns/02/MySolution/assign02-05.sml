(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-05: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(*
fun
isPrime
(n0: int): bool =
let
fun
loop(i0: int): bool =
if
(i0 * i0 > n0)
then true else
(
if n0 mod i0 = 0
then false else loop(i0+1))
in
  if n0 >= 2 then loop(2) else false
end
*)

(* ****** ****** *)

fun isPrime(n0: int): bool =
  if n0 < 2 then false 
  else
  let
    val helper = fn(x) => 
      if (x + 2) * (x +2 ) > n0 
      then true 
      else n0 mod (x+2) <> 0
  in
    int1_forall(n0,helper)
  end

(* end of [CS320-2023-Sum1-assign02-05.sml] *)
