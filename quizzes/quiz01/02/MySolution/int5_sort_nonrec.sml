(* ****** ****** *)

use "./../../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-02-07: 60 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1, 2, 1, 2, 2) = (1, 1, 2, 2, 2)
int5_sort(3, 1, 2, 5, 2) = (1, 2, 2, 3, 5)
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)

val
int2_sort_nr =
fn(xs: int2): int2 =>
   let
       val (x1, x2) = xs
   in
       if x1 <= x2 then (x1, x2) else (x2, x1)
   end

(* ****** ****** *)

val
int3_sort_nr =
fn(xs: int3): int3 => 
let
  val (x1,x2,x3) = xs 
  val x = int2_sort_nr((x1,x2))
in
  
  if x3 < #1(x) then
  (x3,#1(x),#2(x))
  else if x3 > (#2(x)) then
  (#1(x),#2(x),x3)
  else
  (#1(x),x3,#2(x))
end

(* ****** ****** *)

val
int4_sort_nr =
fn(xs: int4): int4 => 
let
  val (x1,x2,x3,x4) = xs 
  val x = int3_sort_nr((x1,x2,x3))
in
  
  if x4 < #1(x) then
  (x4,#1(x),#2(x),#3(x))
  else if x4 > (#3(x)) then
  (#1(x),#2(x),#3(x),x4)
  else if x4 < (#2(x)) then
  (#1(x),x4,#2(x),#3(x))
  else
  (#1(x),#2(x),x4,#3(x))
end

(* ****** ****** *)
val int5_sort_nr =
fn (xs: int5): int5 =>
let
  val (x1,x2,x3,x4,x5) = xs 
  val x = int4_sort_nr((x1,x2,x3,x4))
in
  
  if x5 < (#1(x)) then
  (x5,#1(x),#2(x),#3(x),#4(x))
  else if x5 > (#4(x)) then
  (#1(x),#2(x),#3(x),#4(x),x5)
  else if x5 < (#2(x)) then
  (#1(x),x5,#2(x),#3(x),#4(x))
  else if x5 < (#3(x)) then
  (#1(x),#2(x),x5,#3(x),#4(x))
  else
  (#1(x),#2(x),#3(x),x5,#4(x))
end
  (* ****** ****** *)

(* end of [CS320-2023-Sum1-quiz01-int5_sort_nonrec.sml] *)
