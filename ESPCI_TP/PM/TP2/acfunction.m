function [ AC ] = acfunction( Im1, Im2, x, y )
 [m, n] = size(Im1);
 AC = 0; 
 for i = 1:m
     for j = 1:n
         i_d = i + x;
         j_d = j + y;
         if i_d > m
             i_d = i_d - m;
         elseif i_d < 1
             i_d = i_d + m;
         end
             
         if j_d > n
             j_d = j_d - n;
         elseif j_d < 1
             j_d = j_d + n;
         end
         
         AC = AC + (Im1(i, j)*Im2(i_d, j_d));
     end
 end
 
end

