function [countPaintFloors,paintBoard]= InitBoard(playersNum,boardSize) 
% The function is Creating a board and painting it

numberOfPieces=fix(boardSize^2/playersNum);      % determines how many soldiers/pieces on the board
board=randi([1 playersNum],boardSize,boardSize); % generates a board matrix
color_counter_vec=zeros(playersNum+1,1); 

% counting colored squares and put zero in case of overflow
for i = 1:playersNum 
    count=0;
    for j= 1:boardSize
        for k=1:boardSize
            if board(j,k)==i
                count=count+1;
            end
            if count>numberOfPieces % overflow case - put zero instead
                count=count-1;
                board(j,k)=0; 
                color_counter_vec(playersNum+1,1)=color_counter_vec(playersNum+1,1)+1;
            end
        end
    end
    color_counter_vec(i,1)=count; 
end


% color fixing to missed floors in board
for i = 1:playersNum 
    checkZero=0; %check if we have too much zeros
    if color_counter_vec(i,1)==numberOfPieces % checking current colored floors in color limit 
        checkZero=1;
    end
    for j= 1:boardSize
        for k=1:boardSize
            if board(j,k)==0 && checkZero==0 %if square is not colored
                board(j,k)=i; %color square
                color_counter_vec(i,1)=color_counter_vec(i,1)+1; % add to count for each colored new square
                color_counter_vec(playersNum+1,1)=color_counter_vec(playersNum+1,1)-1;
                if color_counter_vec(i,1)==numberOfPieces % checking the color limit after adding new square
                    checkZero=1;
                end
            end
        end
    end
end


countPaintFloors=color_counter_vec;
paintBoard=board;
end