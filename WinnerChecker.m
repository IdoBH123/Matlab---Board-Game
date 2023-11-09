function [winnerFlag,  winnersArray] = WinnerChecker(board,playersNum, boardSize)
%this function will check which player\s have the smallest number of soliders
%and then check if the player\s exists the winner condition

winnersArray     = 0; % default - no winner yet
winnerFlag       = 0; % default - no winner yet
numSoldiersArray = [];
minPlayerIdx     = [];
minSoldierCount  = []; % min soldiers for player


% building histogram of soldiers
for i=1:playersNum
    occur_mat_i = board==i; % logic matrix of shows of player i
    occur_i= sum(sum(occur_mat_i));
    numSoldiersArray=[numSoldiersArray, occur_i];
end

% finding minimum soldiers
minSoldierCount = min(numSoldiersArray);
for i=1:playersNum
    if numSoldiersArray(i)==minSoldierCount
        minPlayerIdx=[minPlayerIdx,i];
    end
end

%cheking winning condition
if minSoldierCount(1)<(boardSize/2)
    winnerFlag=1;
end

winnersArray = minPlayerIdx;

end
