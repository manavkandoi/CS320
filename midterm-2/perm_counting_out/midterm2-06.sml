
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