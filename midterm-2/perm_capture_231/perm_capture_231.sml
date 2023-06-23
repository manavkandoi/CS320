(* ****** ****** *)
use
"./../../mysmlib/mysmlib-cls.sml";
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

fun list_get_at(xs, n) = 
    if n = 0 then hd(xs)
    else list_get_at(tl(xs), n-1)

exception True

fun perm_capture_231(xs: int list): bool = 
let
    val length = list_length(xs)
in
    let
        val _ = foreach_to_iforeach(list_foreach)(xs,fn(i,x) => if (i >= length -2) then () else if (list_get_at(xs,i+2) < x andalso x < list_get_at(xs,i+1) ) then raise True else ()
        )
    in
        false
    end handle True => true
end (* end-of-let: [perm_capture_231] *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-perm_capture_231.sml] *)
