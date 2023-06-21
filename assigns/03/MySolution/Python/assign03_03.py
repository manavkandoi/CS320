####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-06-12: 10 points
# Please *translate* into Python the SML solution
# to word_neighbors (which is the one for Assign03-02)
#
def fnlist_tabulate(n,f):
    return fnlist_reverse(int1_foldleft(n,fnlist_nil(), lambda xs,i: fnlist_cons(f(i),xs)))
####################################################
def strsub(word, i):
    return word[i]
    


def string_length(word):
    return string_foldleft(word, 0, lambda r,_: r + 1)
    
def string_implode(string):
    return foreach_to_foldleft(fnlist_foreach)(string, "", lambda n,m: n + m)

def string_tabulate(n,m):
    return string_implode(fnlist_tabulate(n,m))

####################################################
def word_neighbors(word):
    """
    Note that this function should returns a fnlist
    (not a pylist)
    Your implementation should be combinator-based very
    much like the posted solution.
    """
    word_len = string_length(word)
    ab = "abcdefghijklmnopqrstuvwxyz"

    return fnlist_concat(string_imap_fnlist\
                      (word, lambda i, c: fnlist_concat(string_imap_fnlist(ab, lambda _, c_: fnlist_sing(string_tabulate(word_len, lambda k: strsub(word, k) 
                                                            if i != k else c_)) if (c != c_) else fnlist_nil()))))

