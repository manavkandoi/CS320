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
    
import nltk
nltk.download('words')
from nltk.corpus import words 

########################################################################
def wordle_guess(hints):

    words_set = [y for y in set(words.words()) if len(y) == len(hints[0])]
    def word_legal(word):

        return word in words_set
    

    #print(hints)
    not_these = ""
    guess_after = ""
    

    to_try = []
    
    #get all the words tried
    tried_words = ["".join([x[1] for x in y]) for y in hints]
    
    #check word
    for ltr in range(len(hints[0])):
        #if the letter is already found, add it to the guess
        already_found = False
        for tupl in hints:

            if tupl[ltr][0] == 1 and already_found ==False:
                already_found = True
                guess_after += tupl[ltr][1]
            #if the letter is not in the word, add it to the list of letters not to try
            if tupl[ltr][0] == 0 and not(tupl[ltr][1] in not_these) and not((2,tupl[ltr][1]) in tupl) and not((1,tupl[ltr][1]) in tupl) :
                not_these +=tupl[ltr][1]
            

            #if the letter is in the word, add it to the list of letters to try
            if tupl[ltr][0] == 2 and not(tupl[ltr][1] in to_try):
                to_try += [(ltr,tupl[ltr][1])]
        
        if (already_found == False):
            guess_after +="_"
            
    #display all the non-combinations
    if ("_" not in guess_after):
        return guess_after
    
    #print(guess_after)
    for tupl in to_try:
        not_these = not_these.replace(tupl[1], "")

    for word in words_set:
        not_word = False

        for ch in word:

            if (ch in not_these):
                not_word = True
                break

        if (not_word == True):
            continue
        #print(word)
        if (word in tried_words):
            continue


        for i in range(len(hints[0])):
            if (guess_after[i] == "_"):
                "skip"

            elif not(guess_after[i] == word[i]):
                not_word = True
                break

        if (not_word == False):
            for tupl in to_try:
                if (word.find(tupl[1]) == tupl[0]) or not(tupl[1] in word) :
                    not_word = True
                    break
##                if (tupl[1] in word):
        if (not_word == True):
            continue

        else:
            #print(word)
            return word
    
    return None    
########################################################################
