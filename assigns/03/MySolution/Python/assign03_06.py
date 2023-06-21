####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
//
HX-2023-06-12: 20 points
Solving the N-queen puzzle
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
"""
####################################################
#def solve_N_queen_puzzle(N):
"""
    ######
    A board of size N is a tuple of length N.
    ######
    For instance, a tuple (0, 0, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are no queen pieces on the board.
    ######
    For instance, a tuple (2, 1, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are two queen pieces; the queen piece
    on the 1st row is on the 2nd column; the queen piece
    on the 2nd row is on the 1st column; the last two rows
    contain no queen pieces.
    ######
    This function [solve_N_queen_puzzle] should return
    a stream of ALL the boards of size N that contain N
    queen pieces (one on each row and on each column) such
    that no queen piece on the board can catch any other ones
    on the same board.
    """
####################################################
def solve_N_queen_puzzle(N):
    def is_safe(board, row, col):
        # Check if it is safe to place a queen at the given position
        for i in range(row):
            if board[i] == col or \
               board[i] == col - (row - i) or \
               board[i] == col + (row - i):
                return False
        return True

    def solve(board, row):
        if row == N:
            # All queens are placed, yield the board as a solution
            yield tuple(board)
        else:
            for col in range(N):
                if is_safe(board, row, col):
                    # Place the queen at the current position
                    board[row] = col
                    yield from solve(board, row + 1)
                    # Backtrack by removing the queen from the current position
                    board[row] = -1

    # Initialize the board with -1 to represent empty squares
    board = [-1] * N

    # Generate all solutions using backtracking
    yield from solve(board, 0)

N = 4
for board in solve_N_queen_puzzle(N):
    print(board)
    print("1")