function [newSolidersBoard,countaftermove,paintBoardAfterRemove] =RemoveSoliders(paintBoard,newBoard,boardSize,playersNum)
%this function will remove the soliders that have match after some turn 
%and resposible to circle the soliders that will be removed
newBoardAfterMove=newBoard;


% checking for paintBoard and soldiers match, in match putting there zero in case
for i=1:boardSize
    for j=1:boardSize
        if paintBoard(i,j)==newBoard(i,j) 
            newBoardAfterMove(i,j)=0; 
            paintBoard(i,j)=0;
        end
    end
end

%circle the soliders that will remove with white color
for i=1:boardSize 
    for j=1:boardSize
        if paintBoard(boardSize+1-i,j)==0 && newBoardAfterMove(boardSize+1-i,j)==0
            scatter(j,i,500,paintBoard(boardSize+1-i,j),'w','Marker','o','LineWidth',2);
            legend('off');   
        end
    end
end

newSolidersBoard=newBoardAfterMove; %the new sloiders board after the removes

countaftermove=CheckNumberOfSoldiers(boardSize,newBoardAfterMove,playersNum); %check how many soliders each player have after the removes

paintBoardAfterRemove=paintBoard; %the new paintboard after the removes
end