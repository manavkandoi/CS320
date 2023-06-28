use "./mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

use "./test.sml";
fun
stream_listize(fxs) =
foreach_to_listize(stream_foreach)(fxs)
(* ****** ****** *)

fun
stream_ziplst(fxss) =
stream_make_map
(
stream_zipstrm
(list_streamize(fxss)), stream_listize)

(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)

val xs1 =
list_streamize[1,2,3]
val xs2 =
list_streamize[1,2,3]
val xs3 =
list_streamize[1,2,3]
val fxss =
stream_ziplst([xs1, xs2, xs3])
val (  ) =
assert320([1,1,1] = stream_get_at(fxss,0))
val (  ) =
assert320([2,2,2] = stream_get_at(fxss,1))
val (  ) =
assert320([3,3,3] = stream_get_at(fxss,2))

(* ****** ****** *)
val () = print( "midterm2-03-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-03.sml] *)


fun
leaf(x) = mytree_node(x, [])

(* ****** ****** *)

fun
stream_listize(fxs) =
foreach_to_listize(stream_foreach)(fxs)

(* ****** ****** *)

val t1 =
mytree_node
(100, int1_map_list(10, fn x => leaf(x)))
val xs = stream_listize(mytree_dfs_streamize(t1))

(* ****** ****** *)

val (  ) = print("midterm2-02-test: passed!\n")

