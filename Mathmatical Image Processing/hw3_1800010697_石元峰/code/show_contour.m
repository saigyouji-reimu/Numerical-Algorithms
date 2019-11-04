 function c_img = show_contour(l, img)
c_img = cat(3,img,img,img);
[m,n] = size(l);
for i=2:m-1
    for j=2:n-1
        if(l(i,j)*l(i,j-1)<0||l(i,j)*l(i,j+1)<0||l(i,j)*l(i+1,j)<0||l(i,j)*l(i-1,j)<0)
            c_img(i,j,1) = 1;
            c_img(i,j,2) = 0;
            c_img(i,j,3) = 0;
        end
    end
end

