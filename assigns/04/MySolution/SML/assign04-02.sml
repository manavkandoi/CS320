(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-20: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () => ...
//
*)

(* ****** ****** *)
fun cube(n: int) : int = n * n * n

fun stream_helper(num: int, start: int, fopr: int -> 'a) : 'a stream =
    let 

    fun helper(i: int): 'a stream = fn() => strcon_cons(fopr(i), helper(i + 1))
    fun helper2(i: int): 'a stream = fn() =>
        if i >= num
	then strcon_nil
        else strcon_cons(fopr(i), helper2(i + 1))
    in

        if num < 0 then helper(start)
    else
        helper2(start)

    end

fun pair_gen_stream(n : int):(int * int) stream = stream_helper(~1, n, fn(i) => (n, i))

val theNatPairs_cubesum: (int * int) stream =
    let

        fun helper(pair_nth : int) : (int * int) stream = fn() =>
        (strcon_cons((0, pair_nth), stream_merge2(pair_gen_stream(pair_nth), helper(pair_nth + 1), fn((i1, j1), (i2, j2)) =>
	    cube(i1) + cube(j1) <= cube(i2) + cube(j2))))

    in
        stream_cons((0, 0), helper(1))
    end


(* end of [CS320-2023-Sum1-assign04-02.sml] *)
