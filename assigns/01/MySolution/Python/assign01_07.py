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
        if not xs:
            return [], []
        else:
            x1 = xs[0]
            if len(xs) == 1:
                return [x1], []
            else:
                x2 = xs[1]
                ys, zs = split(xs[2:])
                return [x1] + ys, [x2] + zs

    def merge(ys, zs):
        if not ys:
            return zs
        elif not zs:
            return ys
        else:
            y1 = ys[0]
            z1 = zs[0]
            if y1 <= z1:
                return [y1] + merge(ys[1:], zs)
            else:
                return [z1] + merge(ys, zs[1:])

    if not xs:
        return []
    else:
        x1 = xs[0]
        if len(xs) == 1:
            return [x1]
        else:
            x2 = xs[1]
            ys, zs = split(xs[2:])
            return merge(mylist_mergesort([x1] + ys), mylist_mergesort([x2] + zs))
