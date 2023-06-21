(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-12: 20 points
*)
(* ****** ****** *)
(*
Note that you are not allowed to define
recursive functions for solving this one.
*)
(* ****** ****** *)
(*
Here are some functions that you can use in
your solution to this one.
*)
val
strsub = String.sub

val
string_length = String.size

val
string_implode = String.implode

val
string_filter = foreach_to_filter_list(string_foreach)
val
string_tabulate =
fn(len, fopr) => string_implode(list_tabulate(len, fopr))

(* ****** ****** *)

(*
A word here is defined to be a (possibly empty)
sequence of lowcase letters in the English alphabet.
Two words w1 and w2 are neighbors if they are of the
same length and differ by exactly one letter.
//
For instance, [water] and [later] are neighbors.
For instance, [abcde] and [abxde] are neighbors.
For instance, [abcde] and [abcde] are not neighbors.
//
Given a word, the function [word_neighbors] returns
a list consisting of *all* the neighbors of the word.
//
fun word_neighbors(word: string): string list = ...
//
Please give an implementation of word_neighbors.
Note that you are NOT allowed to define recursive functions
in your implementation.
//
*)

(* ****** ****** *)

val AB =
"abcdefghijklmnopqrstuvwxyz"

(* ****** ****** *)

val
string_iforeach =
foreach_to_iforeach(string_foreach)
val
string_imap_list =
fn(cs, ifopr) =>
foreach_to_map_list(string_iforeach)(cs, ifopr)

(* ****** ****** *)

(*
val
word_neighbors = fn(word: string) => ...
*)

val word_neighbors = fn(word: string) =>
let
  val word_len = string_length(word)
  val result = ref([])
in
  foreach_to_iforeach(string_foreach)(AB, fn(i,ch) =>
  int1_foreach(26, fn(j) =>
  let
    val new_word = string_tabulate(word_len, fn(k) =>
    if k = i then strsub(AB, j) else strsub(word, k)
)

in
    if new_word <> word then result := !result @ [new_word] else ()
end
  )
  );
!result
end
(* ****** ****** *)
(*
val word_neighbors = fn (word: string) =>
let
val len = string_length(word)
val result = ref([])
in
foreach_to_iforeach(string_foreach)(word, fn (i, ch) =>
int1_foreach(26, fn (j) =>
let
val newWord = string_tabulate(len, fn (k) =>
if i = k then strsub(AB, j) else strsub(word, k)
)
in
if newWord <> word then result := !result @ [newWord] else ()
end
)
)
!result

end
*)

(* end of [CS320-2023-Sum1-assign03-02.sml] *)
