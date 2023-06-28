(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is an individual library,
that is, it is NOT shared by the class.
*)
(* ****** ****** *)
fun xlist_size(xs: 'a xlist): int =
    case xs of
       xlist_nil => 0
     | xlist_cons(x1, xs) => 1 + xlist_size(xs) 
     | xlist_snoc(xs, x1) => 1 + xlist_size(xs)
     | xlist_append(xs,ys) => xlist_size(xs) + xlist_size(ys)
     | xlist_reverse(xs) => xlist_size(xs)

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
    case xs of
       xlist_nil => xs
     | xlist_cons(x1, xs) => xlist_cons(x1, xlist_remove_reverse(xs))
     | xlist_snoc(xs, x1) => xlist_snoc(xlist_remove_reverse(xs), x1)
     | xlist_append(xs, ys) => xlist_append(xlist_remove_reverse(xs), xlist_remove_reverse(ys))
     | xlist_reverse(xs_inner) =>
         case xs_inner of
            xlist_nil => xs_inner
          | xlist_cons(x1_inner, xs_inner') => xlist_snoc(xlist_remove_reverse(xs_inner'), x1_inner)
          | xlist_snoc(xs_inner', x1_inner) => xlist_cons(x1_inner, xlist_remove_reverse(xs_inner'))
          | xlist_append(xs_inner', ys_inner) => xlist_append(xlist_remove_reverse(ys_inner), xlist_remove_reverse(xs_inner'))
          | xlist_reverse(xs_inner') => xlist_remove_reverse(xs_inner')


fun str2int_opt (cs : string): int option =
  let
    fun checkNum (str: string, i: int): bool =
      if i >= String.size(str) then true
      else if ord(String.sub(str, i)) - ord(#"0") >= 0 andalso ord(String.sub(str, i)) - ord(#"0") <= 9 then checkNum(str, i+1)
      else false

    fun convert (i: int,k: int): int option =
      if i = String.size(cs) then SOME(k)
      else if i = 0 then convert(i+1, (ord(String.sub(cs, 0)) - ord(#"0")))
      else convert(i+1, 10*k + (ord(String.sub(cs, i)) - ord(#"0")))
  in
    if cs = "" orelse checkNum(cs, 0) = false then NONE
    else convert(0,0)
  end;

fun find_root(f0: int -> int): int =
    let
      fun helper(n: int): int =
        if(f0(n) = 0) then n
        else if (f0(~n) = 0) then ~n
        else helper(n+1)

    in
      helper(0)
    end

fun list_range(start: int, finish: int): int list =

    let

      fun helper(xs: int list, x: int): int list =
        if x >= finish then xs else helper(xs @ [x], x + 1)
        
    in
      helper([], start)
    end

fun list_tabulate(n: int, f: int -> 'a): 'a list=
    let
      fun helper(i, tester) =
        if i < 0 then tester
        else helper(i-1, f(i)::tester)
    in
      helper(n-1, [])
    end


fun isPrime(n0: int): bool =
  if n0 < 2 then false 
  else
  let
    val helper = fn(x) => 
      if (x + 2) * (x +2 ) > n0 
      then true 
      else n0 mod (x+2) <> 0
  in
    int1_forall(n0,helper)
  end


fun 
forall_to_exists(forall: ('xs,'x0)forall_t): ('xs,'x0)exists_t =
    fn(xs, test) => not (forall(xs, fn(x) => not (test(x))))

fun
ref_get_at
(r0: 'a ref, i: int): 'a = !r0

fun
ref_forall
(r0: 'a ref, test: 'a -> bool): bool = test(!r0)

fun
ref_map_list
(r0: 'a ref, fopr: ('a) -> 'b): 'b list = [fopr(!r0)]

fun
ref_foldleft
(r0: 'a ref, res: 'r, fopr: ('r * 'a) -> 'r): 'r = fopr(res, !r0)

fun
ref_ifoldleft
(r0: 'a ref, res: 'r, fopr: ('r * int * 'a) -> 'r): 'r = fopr(res, 0, !r0)


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


fun
stream_ziplst(xs: 'a stream list): 'a list stream =
let

    fun helper(xs, i0: int) =

        let
            val output = list_map(xs,fn(x) => stream_get_at(x, i0))    
        in
            strcon_cons(output, fn() => helper(xs, i0 + 1))
        end

        handle EndofList => strcon_nil
in

    fn () => helper(xs, 0)
end





(* end of [BUCASCS320-2023-Sum1-mysmlib-ind.sml] *)
