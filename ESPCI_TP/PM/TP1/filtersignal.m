fileID = fopen('signal1.txt','r');
formatSpec = '%f';
signal1 = fscanf(fileID, formatSpec);
figure, plot([1:size(signal1)], signal1);

LPF3 = [+1/3 +1/3 +1/3];
LPF5 = [+1/5 +1/5 +1/5 +1/5 +1/5];
LPF7 = [+1/7 +1/7 +1/7 +1/7 +1/7 +1/7 +1/7];

HPF3 = [-1/3 +2/3 -1/3];
HPF5 = [-1/5 -1/5 +4/5 -1/5 -1/5];
HPF7 = [-1/7 -1/7 -1/7 +6/7 -1/7 -1/7 -1/7];

fl3 = filter(LPF3, 1, signal1);
figure, plot([1:size(fl3)], fl3);

fl5 = filter(LPF5, 1, signal1);
figure, plot([1:size(fl5)], fl5);

fl7 = filter(LPF7, 1, signal1);
figure, plot([1:size(fl7)], fl7);

fh3 = filter(HPF3, 1, signal1);
figure, plot([1:size(fh3)], fh3);

fh5 = filter(HPF5, 1, signal1);
figure, plot([1:size(fh5)], fh5);

fh7 = filter(HPF7, 1, signal1);
figure, plot([1:size(fh7)], fh7);