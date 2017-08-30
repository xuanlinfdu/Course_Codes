Year = 1981:1995;
Result = zeros(80, 5);

for i = 1:length(Year);
    FileName = num2str(Year(i));
    [ ep_SUM, bm_SUM ] = GenerateData( FileName );
    
    Result((6*(i-1)+1), 1) = Year(i);
    Result((6*(i-1)+3), :) = ep_SUM;
    Result((6*(i-1)+5), :) = bm_SUM;
end

dlmwrite('Result.csv', Result);


