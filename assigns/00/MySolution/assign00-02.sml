(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

(*
fun
isPrime
(n0: int): bool =
raise MyNotImplementedExn
*)

fun
isPrime_helper(n0: int, i0:int): bool =
if i0 >= n0
then true
else if (n0 mod i0) <> 0
then isPrime_helper(n0,i0+1)
else false


fun
isPrime(n0: int): bool =
if n0 <= 1
then false
else isPrime_helper(n0,2)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-02.sml] *)
