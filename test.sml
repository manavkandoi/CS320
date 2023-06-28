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
*)


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

fun power(x: real, n: int): real =
if n = 0 then 1.0
else
if n mod 2 = 0 then power(x*x, n div 2)
else x * power(x*x, n div 2)


fun stream_evaluate(fxs: real stream, x0: real): real stream =
let
    fun helper(fxs: real stream, acc: real, pow: int) =
        fn () =>
        case fxs() of
        strcon_nil => strcon_nil
        |strcon_cons(x, fxs') =>
    let
        val newacc = acc + x * power(x0, pow)
    in
        strcon_cons(newacc, helper(fxs', newacc, pow+1))
    end
in
    helper(fxs, 0.0, 0)
end


datatype 'a bintr =
LEAF of 'a | NODE of 'a bintr * 'a bintr
(* ****** ****** *)

(*
HX-2023-03-01: 20 points
The following function is essentially
the same as mapt given on slide 16 in
SLIDE/Summary-SMLNJ.pdf
*)
val
bintr_fold =
fn
( t0: 'a bintr
, fleaf: 'a -> 'r
, fnode: 'r * 'r -> 'r) =>
let
(* ****** ****** *)
val
rec
fold =
fn(t0) =>
case t0 of
LEAF(x0) => fleaf(x0)
|
NODE(tl, tr) =>
fnode(fold(tl), fold(tr))
(* ****** ****** *)
in
  fold(t0)
end (* end of [bintr_fold(t0, fleaf, fnode)] *)

(* ****** ****** *)

val
int_max =
fn(x, y) => if x >= y then x else y

(* ****** ****** *)

(*
Here are some examples that are based
on the bintr_fold combinator
*)

val
bintr_size =
fn(t0) =>
bintr_fold
( t0
, fn _ => 1
, fn(tl, tr) => tl + tr)

val
bintr_height =
fn(t0) =>
bintr_fold
( t0
, fn _ => 1
, fn(tl, tr) => 1+int_max(tl,tr))

(* ****** ****** *)

(*
//
HX-2023-03-01:
//
The following recursive function
[bintr_balanced_rec] checks whether
a given bintr is perfectly balanced.
//
LEAF(x) is perfectly balanced.
NODE(tl, tr) is perfectly balanced if
(1) tl is perfectly balanced, and
(2) tr is perfectly balanced, and
(3) tl and tr are of the same size (or height)
*)

(* ****** ****** *)
(*
//
Here is a recursive implementation that
checks if a given bintr is perfectly balanced
//
fun
bintr_balanced_rec
(t0: 'a bintr): bool =
(
case t0 of
LEAF _ => true
|
NODE(tl, tr) =>
bintr_balanced_rec(tl)
andalso bintr_balanced_rec(tr)
andalso bintr_size(tl) = bintr_size(tr)
)
*)
(* ****** ****** *)

(*
val
bintr_balanced_nonrec = fn(t0: 'a bintr) => ...
*)

(*
bintr_fold(t3, fn(leaf) => true, fn(tl,tr) => 
  if(bintr_size(tl) = bintr_size(tr) )
  then true
  else false)
*)
val
bintr_balanced_nonrec = fn(t0: 'a bintr) => 
  case t0 of NODE(tl, tr) =>
  bintr_fold(t0, fn(leaf) => true, fn(t1 , t2) => 
   if (bintr_size(tl) = bintr_size(tr) andalso bintr_height(tl) = bintr_height(tr)) then true
   else false
   )

val t0 = LEAF(0); val t1 = NODE(t0, t0); val t2 = NODE(t1, t1); val t3 = NODE(t2, t2);
(* ans1 = true *)
val ans1 = bintr_balanced_nonrec(t3)
(* ans2 = false *)
val ans2 = bintr_balanced_nonrec(NODE(t2, t3))

datatype 'a mytree =
  mytree_node of 'a * ('a mytree list)

(* ****** ****** *)
val
int1_map_list =
fn(xs,fopr) =>
foreach_to_map_list(int1_foreach)(xs,fopr)
(*
fun mytree_dfs_streamize(t0: 'a mytree): 'a stream =
    let
        fun traverse(mytree_node(x, child)) =
            let
                fun traverse_child(child) =
                    case child of
                        [] => stream_nil()
                      | t::ts => stream_append(mytree_dfs_streamize(t), traverse_child(ts))
            in
                stream_cons(x, fn () => traverse_child(child)())
            end
    in
        traverse(t0)
    end
    *)
fun mytree_dfs_streamize(t: 'a mytree): 'a stream =
let
fun helper(tree: 'a mytree): 'a stream =
case tree of
mytree_node(value, []) => stream_cons(value, stream_nil())
| mytree_node(value, subtrees) =>
let
fun helper_list(trees: 'a mytree list): 'a stream =
case trees of
[] => stream_nil()
| (t::ts) => stream_append(helper(t), helper_list(ts))
in
stream_cons(value, helper_list(subtrees))
end
in
helper(t)
end


    val Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    val alphabeta_cycling_list: char stream = fn() =>
    let
    fun helper(n) = 
    if (n < 25)
        then strcon_cons(String.sub(Alphabet, n), fn() => helper(n+1) )
    else
        strcon_cons(String.sub(Alphabet, n), fn() => helper(0) )
    in
    helper(0)
    end
    