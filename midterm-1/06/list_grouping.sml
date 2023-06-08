(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)
(*
IF YOU WANT TO SORT A LIST, YOU MUST IMPLEMENT
SOME SORTING FUNCTION ON YOUR OWN. Your implementation
is not allowed to make use of library functions except
those in the library for this class.
*)
(* ****** ****** *)
(*
fun
list_grouping(xs: int list): (int * int) list = ...
*)
(* ****** ****** *)

fun
list_mergesort
(xs: int list): int list =
let

fun
split
(xs: int list): int list * int list =
(
case xs of
  nil => ([], [])
| x1 :: xs =>
(
  case xs of
    nil => ([x1], [])
  | x2 :: xs =>
    let
      val
      (ys, zs) = split(xs)
    in
      (x1 :: ys, x2 :: zs)
    end
)
)

fun merge
( ys: int list
, zs: int list): int list =
(
case ys of
  nil => zs
| y1 :: ys =>
(
  case zs of
    nil => y1 :: ys
  | z1 :: zs =>
    if y1 <= z1
    then y1 :: merge(ys, z1 :: zs)
    else z1 :: merge(y1 :: ys, zs)
)
)

in

case xs of
  nil => []
| x1 :: xs =>
(
  case xs of
    nil => [x1]
  | x2 :: xs =>
    let
      val (ys, zs) = split(xs)
    in
      merge(list_mergesort(x1 :: ys), list_mergesort(x2 :: zs))
    end
)

end (* end-of-[list_mergesort]: let *)

fun list_get(xs, n) = 
    if n = 0 then hd(xs)
    else list_get(tl(xs), n-1)
    
fun
list_grouping(xs: int list): (int * int) list = 
    list_foldleft(list_mergesort(xs), [],
        fn(a, x) => if (a = []) then (1,x) :: a
        else if not(#2 (list_get(a,0)) = x ) then (1,x) :: a
        else case a of a1 :: a2 => (#1(a1) +1, #2(a1)  ) :: a2
    )


(*)
(*
Some testing code:
*)
val N = 1000
val nxs =
list_grouping(list_map(list_fromto(0, N), fn i => N-i))
*)
(* ****** ****** *)
(*
(*
Some testing code:
*)
Your implementation needs to be efficient to pass the
following test:
val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_grouping.sml] *)
