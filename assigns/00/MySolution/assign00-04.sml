(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

(*
fun
str2int
(cs: string): int =
raise MyNotImplementedExn
*)

fun
str2int(cs: string): int=
let
        val n0 = String.size(cs)
        fun helper(i0: int): int =
                if i0<=0 then 0 else
                10 * helper(i0-1)+
                Char.ord(String.sub(cs,i0-1)) - 48
in
        helper(n0)
end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-04.sml] *)
