function [ x, y, u, v ] = displacementfield( Im1, Im2, L )

count = size(Im1)/L;

[x,y] = meshgrid(L/2:L:(count(1)-1)*L+L/2, L/2:L:(count(2)-1)*L+L/2);
u = zeros(count(1), count(2));
v = zeros(count(1), count(2));


for i = 1 : count(1)
    for j = 1 : count(2)
        m1 = Im1(((i-1)*L+1):i*L, ((j-1)*L+1):j*L);
        m2 = Im2(((i-1)*L+1):i*L, ((j-1)*L+1):j*L);
        
        DIFF = correlationfft(m1, m2);
                
        IDEN = correlationfft(m1, m1);
        
        [rmax1, cmax1] = find(DIFF==max(max(DIFF)));
        [rmax2, cmax2] = find(IDEN==max(max(IDEN)));
        
        u(i,j) = cmax1(1) - cmax2(1);
        v(i,j) = rmax1(1) - rmax2(1);
        
    end
end

u = u';
v = v';

end

