use "./mysmlib/mysmlib-cls.sml";
(*
fun stream_take (fxs: 'a stream, n: int): 'a stream =
  if n <= 0 then stream_nil()  
  else
    case fxs() of
      strcon_nil => stream_nil()  | strcon_cons(x, fx) => stream_cons(x, stream_take (fx, n - 1))
*)
(*00*)(*
fun stream_take(fxs: 'a stream, n: int): 'a stream =
fn() =>
if n <= 0 then strcon_nil
else
case fxs() of
strcon_nil => strcon_nil
|strcon_cons(x1, fxs) => strcon_cons(x1, stream_take(fxs, n - 1))

      
fun stream_drop(fxs: 'a stream, n: int): 'a stream =
fn()=>
if n <= 0 then 
case fxs() of
strcon_nil => strcon_nil
|strcon_cons(x1, fxs) => strcon_cons(x1, fxs)
  else
    case fxs() of
      strcon_nil => strcon_nil  
      | strcon_cons(x1, fx) => stream_drop(fx, n - 1)()


*)
(*
fun power_real(x: real, n: int) : real =
    if n = 0 then 1.0
    else
        if n mod 2 = 0 then power_real(x * x, n div 2)
        else x * power_real(x * x, n div 2)

fun stream_evaluate(fxs: real stream, x0: real): real stream =
    let
        fun helper(fxs, xn, n) = fn() => case fxs() of strcon_nil => strcon_nil |strcon_cons(a, fxs') =>
          let
              val x1 = xn + a * power_real(x0 ,n)
          in
              strcon_cons(x1, helper(fxs', x1, n+1))
          end
    in
        helper(fxs, 0.0, 0)
    end
    

#######01


fun power_real(x: real, n: int): real =
if n = 0 then 1.0
else
if n mod 2 = 0 then power_real(x*x, n div 2)
else x * power_real(x*x, n div 2)


fun stream_evaluate(fxs: real stream, x0: real): real stream =
let
    fun helper(fxs: real stream, reference: real, power: int) =
        fn () =>
        case fxs() of
        strcon_nil => strcon_nil
        |strcon_cons(x, fxs') =>
    let
        val newRef = reference + x * power_real(x0, power)
    in
        strcon_cons(newRef, helper(fxs', newRef, power+1))
    end
in
    helper(fxs, 0.0, 0)
end



fun stream_zipstrm(fxss: 'a stream stream): 'a stream stream =
let
fun helper(fxss, index: int) =
let
val output = stream_make_map(fxss, fn strm => stream_get_at(strm, index))
in
strcon_cons(output, fn() => helper(fxss, index + 1))
end
handle EndList => strcon_nil
in
fn() => helper(fxss, 0)
end

*)

fun stream_drawdowns(fxs: int stream): int list stream =
let
    fun compute_drawdowns(fxs: int stream, FirstValue: int): int list stream=
    fn() =>
    case fxs() of
    strcon_nil => strcon_nil
    |strcon_cons(x1, fxs) => 
        let
            fun drawdowns(fxs, FirstValue: int) : int list = 
                case fxs() of
                    strcon_nil => []
                    |strcon_cons(x1, fxs') => 
                        if x1 <= FirstValue then [x1] @ drawdowns(fxs',FirstValue) else []
        in
            
            strcon_cons(drawdowns(fxs, stream_head(fxs)), compute_drawdowns(fxs, stream_head(fxs)))
        end
in
    compute_drawdowns(fxs, stream_head(fxs))
end


(*
fun stream_drawdowns(fxs: int stream): int list stream =
    let fun compute_drawdown(fxs: int stream, x1: int,ys:int list): int list=fn()=>
    case fxs() of
    strcon_nil => []
    |strcon_cons(x2, fxs') => 
        if x2 <= x1 then ys :: x2 :: compute_drawdown(fxs', x1, ys) else compute_drawdown(fxs', x1, ys)
    in
        strcon_cons(compute_drawdown(fxs, stream_head(fxs), []), fn() =>compute_drawdown(fxs, stream_head(fxs), []))
    end




fun stream_take(fxs: 'a stream, n: int): 'a stream =
fn() =>
if n <= 0 then strcon_nil
else
case fxs() of
strcon_nil => strcon_nil
|strcon_cons(x1, fxs) => strcon_cons(x1, stream_take(fxs, n - 1))

      
fun stream_drop(fxs: 'a stream, n: int): 'a stream =
fn()=>
if n <= 0 then 
case fxs() of
strcon_nil => strcon_nil
|strcon_cons(x1, fxs) => strcon_cons(x1, fxs)
  else
    case fxs() of
      strcon_nil => strcon_nil  
      | strcon_cons(x1, fx) => stream_drop(fx, n - 1)()


fun list_get_at(xs, n) = 
    if n = 0 then hd(xs)
    else list_get_at(tl(xs), n-1)

exception True


fun perm_counting_out (xs, k0) =
    let
        fun helper ([], _, ys) = list_reverse(ys)
          | helper (xs, k, ys) =
            let
                val n = list_length(xs)
                val k' = (k + k0) mod n
                val x = list_get_at(xs,k')
                val xs' = take(xs,k') @ drop(xs,(k' + 1) )
            in
                helper (xs', k', x :: ys)
            end
    in
        helper (xs, 0, [])
    end


fun
stream_permute_list(xs: 'a list): 'a list stream = 
let
  fun insert(x, []) = [[x]]
  | insert(x, (y::ys)) =
  (x::y::ys) :: list_map((insert(x, ys)), (fn ys => y::ys))

  fun permutate([]) = list_streamize [[]]
  | permutate((x::xs)) =
        let
            val permute = permutate(xs)
        in
            stream_concat(stream_make_map(permute, (fn x1 => list_streamize(insert(x, x1))))) 
        end
in
    permutate(xs)
end

*)