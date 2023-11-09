clc
clear;
close all
%% Game General Settings
playersNum=6;
boardSize=7;

%% Generate paintBoard and soldiersBoard
soldiers=['o','x','p','s','d','^'];
[initcount,paintBoard]=InitBoard(playersNum,boardSize); %will output the initial board with equals colors in the game
[soldiersonBoard]=SpreadSoldiers(paintBoard,initcount,playersNum,boardSize);

% Initializing
countaftermove = initcount ; % countaftermove counts the floors for each player
winnerFlag   = 0;
winnersArray = 0;
playerTurn   = 0; %initial state 0,means player 1
round        = 0;

% display how many initial soldiers each player have.
for i= 1:playersNum
    fprintf('player %d has %d soldiers\n',i, countaftermove(i));
end

%% Game Flow
% Infinite loop until someone wins
while ~winnerFlag
    
    sprintf("Player %d turn\n",playerTurn+1);
    sprintf("Player %d turn\n",round+1);
    hold on
    
    title ( sprintf('Turn Player - %d Round %d' ,playerTurn+1,round+1));
    PlotBoard(boardSize,paintBoard,soldiersonBoard,soldiers,playersNum);
    
    fprintf("Player %d turn\n",playerTurn+1);
    
    %% The player chooses the move
    validMove=0;  %check for valid input move
    while validMove==0
        move=input('Choose your move(Up,Right,Left,Down,Random): ','s');
        [soldiersonBoard_temp,validMove]= MovesInTheGame(move,soldiersonBoard,playersNum,boardSize,paintBoard,countaftermove); %countaftermove
        if validMove==0
            disp('error, enter valid move: Up ,Right, Left ,Down,Random');
        else
            soldiersonBoard = soldiersonBoard_temp;
        end
    end
    
    %% Plot the board after the move
    PlotBoard(boardSize,paintBoard,soldiersonBoard,soldiers,playersNum)
    pause(3) %this pause to show the soliders on the board after move
    
    %% Marking and removing the soldiers-floor matching
    [soldiersonBoard,countaftermove,paintBoard]=RemoveSoliders(paintBoard,soldiersonBoard,boardSize,playersNum);
    pause(3) %this pause show the markers of the soliders will remove
    PlotBoard(boardSize,paintBoard,soldiersonBoard,soldiers,playersNum);
    
    %% Soldiers summary
    for i= 1:playersNum
        fprintf('player %d has %d soldiers\n',i, countaftermove(i));
    end
    hold off
    
    %% Check for Winner
    [winnerFlag,  winnersArray] = WinnerChecker(soldiersonBoard, playersNum, boardSize);
    
    playerTurn = rem(playerTurn+1, playersNum); % turn changing
    if playerTurn==0
        round=round+1;
    end
end

%% Winner Announce
disp("The Winner is player number: ");
disp(winnersArray)

