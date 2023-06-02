####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign01-lib.sml)
# mylist_rappend (see list_rappend in assign01-lib.sml)
# mylist_reverse (see list_reverse in assign01-lib.sml)
#
####################################################

def mylist_append(x,y):
    for i in y:
        x.append(i)
    return x



def mylist_rappend(x,y):
    for i in range(len(y),0,-1):
        x.append(y[i-1])
    return x

def mylist_reverse(x):
    y=[]
    for i in range(len(x),0,-1):
        y.append(x[i-1])
    return y
