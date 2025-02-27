(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of in satisfying
c < a < b. Note that a, b, and c doe not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

fun
perm_capture_231
(xs: int list): bool =
let

fun
helper1(xs) =
(
case xs of
nil => false
|
x1 :: xs =>
helper2(x1, xs) orelse helper1(xs))

and
helper2(x1, xs) =
(
case xs of
nil => false
|
x2 :: xs =>
(
(x1 < x2)
andalso
helper23(x1, x2, xs)) orelse helper2(x1, xs))

and
helper23(x1, x2, xs) =
(
case xs of
nil => false
|
x3 :: xs =>
(x1 > x3) orelse helper23(x1, x2, xs))

in
  helper1(xs)
end (* end-of-let: [perm_capture_231] *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-perm_capture_231.sml] *)
