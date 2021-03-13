offset =1;
for a_iter=1:230  
K=imread(sprintf('NonMS_Source3 (%d).jpg',offset));
if ndims(K) ==3
    k=rgb2gray(K);
else
    k=K;
end
    k1=imresize(k,[512,512]);
    imwrite(k1,sprintf('NonMS_Source3 (%d).TIF',offset));
    offset=offset+1;
end