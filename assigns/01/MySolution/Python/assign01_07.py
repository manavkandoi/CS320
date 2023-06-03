####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign01-lib.sml)
#
####################################################

def mylist_mergesort(xs):
    def split(xs):
        if mylist_nilq(xs) == True:
            return (mylist_nil(), mylist_nil()) 
        else:
            if mylist_nilq(xs.get_cons2()) == True:
                return (mylist_cons(xs.get_cons1(), mylist_nil()), mylist_nil())
            else:
                (ys, zs) = split(xs.get_cons2().get_cons2())
                return (mylist_cons(xs.get_cons1(), ys), mylist_cons(xs.get_cons2().get_cons1(), zs))
    
    def merge(ys, zs):
        if mylist_nilq(ys):
            return zs
        elif mylist_nilq(zs):
            return ys
        else:
            if ys.get_cons1() <= zs.get_cons1():
                return mylist_cons(ys.get_cons1(), merge(ys.get_cons2(), zs))
            else:
                return mylist_cons(zs.get_cons1(), merge(ys, zs.get_cons2()))

    if mylist_nilq(xs) == True:
        return mylist_nil()
    elif mylist_nilq(xs.get_cons2()) == True:
        return mylist_cons(xs.get_cons1(), mylist_nil())
    else:
        (ys, zs) = split(xs.get_cons2().get_cons2())
        return merge(mylist_mergesort(mylist_cons(xs.get_cons1(), ys)), mylist_mergesort(mylist_cons(xs.get_cons2().get_cons1(), zs)))


