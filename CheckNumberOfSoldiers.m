function counterAfterMove =CheckNumberOfSoldiers(boardSize,solidersOnBoard,playersNum)
% this fuction check how many soliders each player have after some move

counter=zeros(playersNum+1,1);
% counting how many soldiers left to the players
for i = 1:playersNum 
    count=0;
    for j= 1:boardSize
        for k=1:boardSize
            if solidersOnBoard(j,k)==i
                count=count+1;
            end
            
            if solidersOnBoard(j,k)==0&&i==1
                counter(playersNum+1,1)=counter(playersNum+1,1)+1;
            end
        end
    end
    counter(i,1)=count;
end

counterAfterMove=counter;
end