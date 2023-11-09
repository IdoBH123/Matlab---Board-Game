function [] = PlotBoard(boardSize,paintBoard,soldiersonBoard,soldiers,playersNum)
% the functions is responsbale to display the boared with the soliders on
% it with the legend 

%% Color settings for board and soldiers
boardColors={[0.364 0.690 0.937],[0.996 0.5 0.5],[0.757 0.937 0.757],[0.996 0.597 0.898],[0.996 0.898 0.699],[0.398 0.398 0.398]}; %colors of the floor paint board and use the RGB colors options
soldiersColors={[0 0 0.79],[0.989 0 0],[0.160 0.741 0],[0.796 0 0.597],[0.699 0.464 0],[0.238 0.050 0.050]}; %colors of all the players in the game with the RGB colors options


%% Creating shapes legend
shapes = {};
for i= 1:playersNum
    player= ['player ',num2str(i)];
    shapes = [shapes, scatter(1,1,10,soldiersColors{i},soldiers(i),'DisplayName',player )];
end

% Plot the Board with colors
for i=1:boardSize
    for j=1:boardSize
        if paintBoard(boardSize+1-j,i)~=0 %check for not empty cube
            fill([i-0.5,i+0.5,i+0.5,i-0.5,i-0.5],...
                [j-0.5,j-0.5,j+0.5,j+0.5,j-0.5],...
                boardColors{paintBoard(boardSize+1-j,i)}); %paint the board and use the
        else
            fill([i-0.5,i+0.5,i+0.5,i-0.5,i-0.5],...
                [j-0.5,j-0.5,j+0.5,j+0.5,j-0.5],...
                'w');
        end
    end
end

% plot the colored soldiers on the board
for i=1:boardSize
    for j=1:boardSize
        if soldiersonBoard(boardSize+1-i,j)~=0
            scatter(j,i,200,soldiersColors{soldiersonBoard(boardSize+1-i,j)},'Marker',soldiers(soldiersonBoard(boardSize+1-i,j)),'LineWidth',3);
        end
    end
end

% markers shapes for legend
handarray =[]; %store all the shapes of the players
for i =1 : playersNum
    marker = shapes(i);
    handarray = [handarray, marker(1)];
end

legend(handarray,'Location','NortheastOutside'); %disp the shapes of the players in legend and the location for this legend

axis equal 
axis off 
end