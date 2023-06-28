####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-06-19: 10 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    """
    Given two generators gen1 and gen2 and a comparison
    function lte3, the function generator_merge2 returns
    another generator that merges the elements produced by
    gen1 and gen2 according to the order specified by lte3.
    The function generator_merge2 is expected to work correctly
    for both finite and infinite generators.
    """
    el_x = next(gen1,None)
    el_y = next(gen2,None)

    while el_x is not None or el_y is not None:
        if el_x is None:
           yield el_y
           el_y = next(gen2,None)
        elif el_y is None:
           yield el_x
           el_x = next(gen1,None)
        elif lte3(el_x,el_y):
           yield el_x
           el_x = next(gen1,None)
        else:
           yield el_y
           el_y = next(gen2,None)
           
    return None
####################################################
