########################
# HX-2023-06-20: 10 points
########################
"""
Given two words w1 and w2 of the same length,
please implement a function wordle_hint(w1, w2)
that return a sequence of pairs (i, c) for each
character c in w2 where i indicates the color
of c according to the rule of the wordle game:
0: c does not appear in w1
1: c appears in w1 at the same position as it does in w2
2: c appears in w1 at a different position as it does in w2
Please note that the number of times (1, c) or (2, c) appearing
in the returned sequence must be less than or equal to the number
of times c appearing in w1.
For instance,
w1 = water and w2 = water
wordle_hint(w1, w2) =
(1, w), (1, a), (1, t), (1, e), (1, r)
For instance,
w1 = water and w2 = waste
wordle_hint(w1, w2) =
(1, w), (1, a), (0, s), (2, t), (2, e)
For instance,
w1 = abbcc and w2 = bbccd
wordle_hint(w1, w2) =
(2, b), (1, b), (2, c), (1, c), (0, d)
"""
########################################################################
def wordle_hint(word1, chr):
    
    wrd =[]
    word_in = []
    number = []


    for tupl in zip(word1,chr):
        wrd_1, ch = tupl

        if not(ch in word_in):
            word_in.append(ch)

            number.append(word1.count(ch))

        ind = word_in.index(ch)

        if (wrd_1 == ch):
            wrd.append((1, ch))
            number[ind] -= 1

        else:

            if ( number[ind] == 0):
                wrd.append((0,ch))

            else:
                
                wrd.append((2, ch))
    return wrd
########################################################################
