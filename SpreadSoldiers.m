function [boardWithSoldiers] = SpreadSoldiers(paintBoard,count,playersNum,boardSize)
%this function responsible to set up the soldiers on the board without any
%match with the paintboard

piecesBoard=zeros(boardSize); % soldiers matrix
piecesCounter=zeros(playersNum+1,1); % counts number of soldiers for each color includes zeros (white square)

flags=zeros(playersNum+1,1); % responsible to store all the try possibility numbers

checkConflict=0; % in case of conflict, recreating the original board
i=1;
while i<= boardSize
    j=1;  
    while j<= boardSize
        
        while true % randomize soldiers until no conflict

            if checkConflict==1 % if confilct found need to randomize again
                % re-initialzing the loops
                i=1;
                j=1;
                piecesBoard=zeros(boardSize);
                flags=zeros(playersNum+1,1);
                checkConflict=0;
                piecesCounter=zeros(playersNum+1,1); % creates the counting array again with zeros 
            end
            
            % generate soldier number or nothing(0)
            randSoldierNum=randi([0,playersNum]); 
            flags(randSoldierNum+1,1)=1; % sign this option for potential conflict
            
            % in case of generating no-soldier and valid soldier-floor constraint
            if randSoldierNum==0 && piecesCounter(playersNum+1,1)<count(playersNum+1,1)
                piecesBoard(i,j)=randSoldierNum;
                piecesCounter(playersNum+1,1)=piecesCounter(playersNum+1,1)+1;
                flags=zeros(playersNum+1,1);
                break;
            % in case of generating soldier check for:
                    % valid floor for the soldier
                    % color-soldier limit
            elseif  randSoldierNum~=0 && paintBoard(i,j)~=randSoldierNum && piecesCounter(randSoldierNum,1)<count(randSoldierNum,1) 
                piecesBoard(i,j)=randSoldierNum;                                  
                piecesCounter(randSoldierNum,1)=piecesCounter(randSoldierNum,1)+1;          % counts how many times we used the soldiers
                flags=zeros(playersNum+1,1);
                break;
            end
            
            % in case of no match signs conflict
            checkConflict=1;
            for idx=1:playersNum+1
                checkConflict=checkConflict*flags(idx,1);
            end
        end
        j=j+1; % increase j for the loop
    end
    i=i+1;  % increase i for the loop
end


boardWithSoldiers=piecesBoard;
end

    



    
