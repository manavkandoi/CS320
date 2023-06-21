(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

(*
val the_ln2_stream: real stream = fn() => ...
*)

fun stream_from(n:int): int stream = fn() => strcon_cons(n, stream_from(n+1))
fun helper(num: real stream, reference: real, denominator: real, sign: real): real stream = fn() =>
    case num() of
        strcon_nil => strcon_nil
        |strcon_cons(x,num)=>

    let
        val ref2 =reference+(1.0/(sign*denominator))
        val denominator2 = denominator + 1.0
        val sign2 = sign * ~1.0

    in
        strcon_cons(ref2,helper(num,ref2,denominator2,sign2))
    end

val num =stream_from(0)
val xs =stream_make_map(num, fn x => Real.fromInt x)
val the_ln2_stream: real stream = helper(xs, 0.0, 1.0, 1.0)





    
    
    
    
    
(*
    let
        fun test(i0:int, acc)=
            fn() =>
            let 
                fun help(i) = Real.fromInt(pow_int_int(~1, i-1))/Real.fromInt i
            in
                if i0 <= 0 then strcon_nil 
                else strcon_cons(help(i0)+acc, test(i0+1, help(i0)+acc))
            end
    in
        test(1, 0.0)()
    end
    *)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
