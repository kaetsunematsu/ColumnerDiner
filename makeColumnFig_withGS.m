

D=dir(['*.txt']);
Num = length(D)
cmap = colormap(jet);


for fcount = 1:Num
    filename=[D(fcount).name];
    data = load(filename);
    [m n] = size (data);

    a = data(:,1);
    b = data(:,2);
    leg = data(:,3);

    subplot(1,Num,fcount)
    for i= 1:m

        if leg(i)==0
            width = 1.0;% the same width as 'clay'
            x = [0 0 width width];
            y = [a(i) b(i) b(i) a(i)];
            patch(x,y, 'k') %disturbed
        elseif leg(i)== -9999 % no data
%             width = 10.0
%             x = [0 0 width width];
%             y = [a(i) b(i) b(i) a(i)];
%             patch(x,y, 'w') %no data
        else
            width = leg(i) 

            x = [0 0 width width];
            y = [a(i) b(i) b(i) a(i)];
            ratio = leg(i) * 1/8;
            color = cmap(64*ratio,:);
            patch(x,y, color) 
        end

        hold on
    end
    ax = gca;
    ax.YDir = 'reverse';
    ax.XTick = [1 2 3 4 5 6 7 8];
    ax.XTickLabelRotation = 60;
    ax.XTickLabel = {'clay', 'silt', 'vf. sand','f. sand', 'm.sand', 'c.sand', 'vc.sand', 'gravel'};
%     ax.XMinorTick = 'on';
    ax.YMinorTick = 'on';
    ax.YLim = [0.0 8.0] ;
    ax.XLim = [0.0 8.0];
    ax.TickDir = 'out';
    texttitle = strrep(filename,'.txt','')
    title(texttitle,'FontSize',12)
end



