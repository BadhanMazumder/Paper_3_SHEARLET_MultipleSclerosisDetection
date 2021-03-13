
ref= imread('NonMS (1).TIF');
trgt=imread('NonMS (2).TIF');
output = imhistmatch(trgt,ref);
subplot(2,2,1); imshow(ref)
subplot(2,2,2); imshow(trgt)
subplot(2,2,3); imshow(output)
