function [ pic_rot ] = picrotate(pic, angle)

[nrows, ncols]= size(pic); 

rads=2*pi*angle/360;  

%create a bigger image to fit the rotated image

row_new=ceil(nrows*abs(cos(rads))+ncols*abs(sin(rads)));                      
col_new=ceil(nrows*abs(sin(rads))+ncols*abs(cos(rads)));                     
pic_rot=ones(row_new, col_new) * 255;

%calculating center of original and rotated image
xo=ceil(nrows/2);                                                            
yo=ceil(ncols/2);

midx=ceil((size(pic_rot,1))/2);
midy=ceil((size(pic_rot,2))/2);

% calculating corresponding coordinates of the pixels 
for i=1:size(pic_rot,1)
    for j=1:size(pic_rot,2)                                                       

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads);                                       
         y= -(i-midx)*sin(rads)+(j-midy)*cos(rads);                             
         x=round(x)+xo;
         y=round(y)+yo;

         if (x>=1 && y>=1 && x<=size(pic,1) &&  y<=size(pic,2) ) 
              pic_rot(i,j)=pic(x,y);  
         end

    end
end



end

