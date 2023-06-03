####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign01-lib.sml)
#
####################################################


def mylist_append(xs, ys):

    if mylist_nilq(xs) == True:
        return ys
    else:
        return mylist_cons(xs.get_cons1(), mylist_append(xs.get_cons2(), ys))

def mylist_quicksort(xs):
    def qsort(xs):
        if xs.get_ctag() == 0:
            return mylist_nil()
        else:
            (ys, zs) = qpart(xs.get_cons2(), xs.get_cons1())
            ys = qsort(ys)
            zs = qsort(zs)
            return mylist_append(ys, mylist_cons(xs.get_cons1(), zs))
    
    def qpart(xs, p0):
        if xs.get_ctag() == 0:
            return (mylist_nil(), mylist_nil())
        else:
            (ys, zs) = qpart(xs.get_cons2(), p0)
            if xs.get_cons1() <= p0:
                return (mylist_cons(xs.get_cons1(), ys), zs)
            else:
                return (ys, mylist_cons(xs.get_cons1(), zs))

    return qsort(xs)
