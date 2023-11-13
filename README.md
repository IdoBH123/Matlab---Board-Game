# MATLAB Board Game

Goal: To eliminate as many of your soldiers as possible before the other players.

Setup:

1. The board is randomly marked with different colors as a number so that each color appears an equal number of times. Some slots can remain colorless.
2. The board is then randomly populated with soldiers of each color. The number of soldiers from each color equals the number of squares marked in each color.
3. The arrangement of the soldiers is done in such a way that after the initial arrangement, there is no situation in which a soldier is found in the square with its color.

Gameplay:

1. In each turn, a player can choose one of the following 5 actions to change the state of the soldiers on the face of the board:
  Move all soldiers one slot up. The soldiers in the top row move to the bottom row.
  Move all soldiers one slot down. The soldiers in the bottom row move to the top row.
  Move all soldiers one square to the right. The soldiers in the right column move to the left column.
  Move all soldiers one square to the left. The soldiers in the left column move to the right column.
  Shuffle all the soldiers on the board to a random position. No soldier will appear after shuffling on a square of his color.
2. At the end of each turn, the soldiers are removed from all the squares where there is a soldier of the same color, and the square also vacates (becomes white).

End Game:

The game ends when one of the players has fewer soldiers left than half the squares in each row/column. For example, on an 8x8 board, the game ends when one player has 3 left soldiers or less.
The winner is the player left at the end of the game with the least number of soldiers.
