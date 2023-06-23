(* ****** ****** *)

use
"./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a list xs and a natural number k0,
perm_counting_out(xs, k0) returns a permutation
of xs where the elements are listed according to
the order they are "counted out" in the following
process of counting:
//
Counting of the elements xs goes left to right
and the first count is 0. When the count reaches
k0, the element being counted is removed (that is,
the element is counted out) and counting starts again
with the following element. If counting reached the
last element remaining in the list, then the next element
to be counted is the first element in the list. Counting
stops when all the elements are counted out.
//
For instance,
perm_counting_out([1,2,3], 0) = [1,2,3]
perm_counting_out([1,2,3], 1) = [2,1,3]
perm_counting_out([1,2,3], 2) = [3,1,2]
perm_counting_out([1,2,3], 3) = [1,3,2]
perm_counting_out([1,2,3,4], 1) = [2,4,3,1]
perm_counting_out([1,2,3,4], 3) = [4,1,3,2]
//
*)
fun list_take(xs:int list, n: int)=
if n<=0 then [] else
case xs of
[] => []
|x1::xs1 => x1::list_take(xs1,n-1);

fun list_drop(xs:int list, n: int)=
if n<=0 then xs else
case xs of
[] => [] 
|x1::xs1 => list_drop(xs1,n-1);

fun list_get_at(xs, n) = 
    if n = 0 then hd(xs)
    else list_get_at(tl(xs), n-1)
(* ****** ****** *)
fun perm_counting_out (xs, k0) =
    let
        fun helper ([], _, ys) = list_reverse(ys)
          | helper (xs, k, ys) =
            let
                val n = list_length(xs)
                val k' = (k + k0) mod n
                val x = list_get_at(xs,k')
                val xs' = list_take(xs,k') @ list_drop(xs,(k' + 1) )
            in
                helper (xs', k', x :: ys)
            end
    in
        helper (xs, 0, [])
    end
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-perm_counting_out.sml] *)
