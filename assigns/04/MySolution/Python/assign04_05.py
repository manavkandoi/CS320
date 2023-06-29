########################
# HX-2023-06-20: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN.
"""

########################################################################



import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *

def str_repl(str, i, repl):
    return str[:i] + repl + str[i + 1:]

def wordle_guess(hints):


    dict_count = dict()
    to_ignore = set()
    my_guess = "$" * len(hints[0])

    for hintx in hints:
        
        word = pylist_make_map(pylist_make_filter(hintx,lambda x:x[0] !=0), lambda x:x[1])
        in_word_count = {x:word.count(x) for x in word}
        

        for k in in_word_count:
            if k not in dict_count or in_word_count[k] > dict_count[k]:
                dict_count[k] = in_word_count[k]

        for i,c in enumerate(hintx):
            if c[0] == 1:
                my_guess = str_repl(my_guess,i,c[1])
            else:
                to_ignore.add((i,c[1]))

    counts_list = []

    for k in dict_count:
        counts_list+=([k] * dict_count[k])

    def safe_word(wrd):

        def pos_safe(s):
            return foreach_to_iforall(string_foreach)(s, lambda i,c: (not (i,c) in to_ignore))

        def safe_count(d, s):
            res = True
            wd_list = list(s)
            in_word_count = {x:wd_list.count(x) for x in wd_list}
            
            for k in d:
                if not ((k in in_word_count) and in_word_count[k] >= d[k]):
                    res =  False
            return res

        return pos_safe(wrd) and safe_count(dict_count,wrd) and (not '$' in wrd)


    def next_in_s(nxt1):
        children_of = []
        try:
            i = nxt1.index('$')
            return string_imap_pylist(counts_list, lambda _, c: str_repl(nxt1, i , c))
        except ValueError:
            return []

    if '$' in my_guess:
        return stream_get_at(stream_make_filter(graph_dfs([my_guess], next_in_s), lambda s: safe_word(s)), 0)
    else:
        return my_guess
    
    
########################################################################
