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

val the_ln2_stream: real stream = 
let
val r0 = ref 1.0
fun helper(n: int): real=
if n=0 orelse n=1 then (r0 := !r0; !r0)
else if n mod 2 = 0 then (r0 := !r0 -(1.0 / Real.fromInt n); !r0)
else (r0:= !r0 +(1.0 /Real.fromInt n); !r0)
in
stream_tabulate(~1,fn(x)=>helper(x+1))
end


    
    
    
    
    
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
