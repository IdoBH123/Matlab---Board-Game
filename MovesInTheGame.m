function [newBoard,validMove]=MovesInTheGame(move,soldiersonBoard,playersNum,boardSize,board,solidersHistogram)
%this function responsible to move the soldiersonBoard after move cases

newBoard=[];%array that show us the board after some move
validMove=[];
switch move
    case 'Up'
        newBoard=[soldiersonBoard(2:end,:) ; soldiersonBoard(1,:)];
        validMove=1;
    case 'Right'
        newBoard=[soldiersonBoard(:,end) soldiersonBoard(:,(1:end-1))];
        validMove=1;
    case 'Left'
        newBoard=[soldiersonBoard(:,(2:end)) soldiersonBoard(:,1)];
        validMove=1;
    case 'Down'
        newBoard=[soldiersonBoard(end,:); soldiersonBoard(1:end-1,:)];
        validMove=1;
    case 'Random'
        newBoard=spreadSoldiers(board,solidersHistogram,playersNum,boardSize);
        validMove=1;
        
        
    otherwise  %this option active when the player input some other word diffrent from the options
        validMove=0;
end

end