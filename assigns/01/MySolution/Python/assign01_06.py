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


def list_quicksort(xs):
    def qsort(xs):
        if not xs:
            return []
        else:
            x1 = xs[0]
            ys, zs = qpart(xs[1:], x1)
            ys = qsort(ys)
            zs = qsort(zs)
            return ys + [x1] + zs

    def qpart(xs, p0):
        if not xs:
            return [], []
        else:
            x1 = xs[0]
            ys, zs = qpart(xs[1:], p0)
            if x1 <= p0:
                return [x1] + ys, zs
            else:
                return ys, [x1] + zs

    return qsort(xs)
