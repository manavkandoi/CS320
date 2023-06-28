(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-19: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-01.sml] *)

fun
strcon_single(x0: 'a) =
strcon_cons(x0, stream_nil())

fun
insertList
( xs: 'a list, i0: int, x0: 'a): 'a list =
if i0 <= 0 then (x0 :: xs) 
else
(hd(xs)::insertList(tl(xs),i0-1,x0))


fun
stream_permute_list(xs:'a list):'a list stream=fn()=>(
case xs of
nil =>strcon_single([])
|x1::xs =>let


val n0=length(xs)
val xss=stream_permute_list(xs)
fun helper(i0:int): 'a list stream = 
fn() =>
if i0 > n0 then strcon_nil else
stream_append(stream_make_map(xss, fn(xs) => insertList(xs, i0, x1)), helper(i0+1))()


in
  helper(0)()
end
)
