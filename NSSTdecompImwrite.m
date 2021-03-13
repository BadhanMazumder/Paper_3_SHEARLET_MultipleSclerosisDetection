clc;
close all;
%-------------------------------Read MRI Image-------------------------------
ref_im= imread('MS (13).TIF');

trgt_im=imread('MS (18).TIF');

%-------------------------------Histogram Matching with Reference Image-------------------------------
out_im = imhistmatch(trgt_im,ref_im);
imshow(out_im);
%-------------------------------2D Non-subsmaple Shearlet Transform (NSST) Parameter Declaration-------------------------------
lpfilt='maxflat';
shear_parameters.dcomp =[1 2 3 4];  % Decomp_level is 5 = [2^0 2^1 2^2 2^3 2^4] = [1 2 4 8 16]
shear_parameters.dsize =[32 32 16 8];  % size of each level [32x32 32x32 16x16 8x8]
[dst,shear_f]=nsst_dec2(out_im,shear_parameters,lpfilt);

%-------------------------------2D NSST decomposition-------------------------------

%------------------------Layer1------------------------
subband11=dst{1};
%------------------------Layer2------------------------
subband21=dst{2}(:,:,1);imwrite(subband21,'subband21.png');
subband22=dst{2}(:,:,2);imwrite(subband22,'subband22.png');
%------------------------Layer3------------------------
subband31=dst{3}(:,:,1);imwrite(subband31,'subband31.png');
subband32=dst{3}(:,:,2);imwrite(subband32,'subband32.png');
subband33=dst{3}(:,:,3);imwrite(subband21,'subband33.png');
subband34=dst{3}(:,:,4);imwrite(subband21,'subband34.png');
%------------------------Layer4------------------------
subband41=dst{4}(:,:,1);imwrite(subband41,'subband41.png');
subband42=dst{4}(:,:,2);imwrite(subband42,'subband42.png');
subband43=dst{4}(:,:,3);imwrite(subband43,'subband43.png');
subband44=dst{4}(:,:,4);imwrite(subband44,'subband44.png');
subband45=dst{4}(:,:,5);imwrite(subband45,'subband45.png');
subband46=dst{4}(:,:,6);imwrite(subband46,'subband46.png');
subband47=dst{4}(:,:,7);imwrite(subband47,'subband47.png');
subband48=dst{4}(:,:,8);imwrite(subband48,'subband48.png');
%------------------------Layer5------------------------
subband51=dst{5}(:,:,1);imwrite(subband51,'subband51.png');
subband52=dst{5}(:,:,2);imwrite(subband52,'subband52.png');
subband53=dst{5}(:,:,3);imwrite(subband53,'subband53.png');
subband54=dst{5}(:,:,4);imwrite(subband54,'subband54.png');
subband55=dst{5}(:,:,5);imwrite(subband55,'subband55.png');
subband56=dst{5}(:,:,6);imwrite(subband56,'subband56.png');
subband57=dst{5}(:,:,7);imwrite(subband57,'subband57.png');
subband58=dst{5}(:,:,8);imwrite(subband58,'subband58.png');
subband59=dst{5}(:,:,9);imwrite(subband59,'subband59.png');
subband5_10=dst{5}(:,:,10);imwrite(subband5_10,'subband5_10.png');
subband5_11=dst{5}(:,:,11);imwrite(subband5_11,'subband5_11.png');
subband5_12=dst{5}(:,:,12);imwrite(subband5_12,'subband5_12.png');
subband5_13=dst{5}(:,:,13);imwrite(subband5_13,'subband5_13.png');
subband5_14=dst{5}(:,:,14);imwrite(subband5_14,'subband5_14.png');
subband5_15=dst{5}(:,:,15);imwrite(subband5_15,'subband5_15.png');
subband5_16=dst{5}(:,:,16);imwrite(subband5_16,'subband5_16.png');

%-------------------------------Display NSST Subbands-------------------------------

figure,
subplot(6,6,1);imshow(out_im);subplot(6,6,2);imshow(subband11);
subplot(6,6,3);imshow(subband21);subplot(6,6,4);imshow(subband22);
subplot(6,6,5);imshow(subband31);subplot(6,6,6);imshow(subband32);subplot(6,6,7);imshow(subband33);subplot(6,6,8);imshow(subband34);
subplot(6,6,9);imshow(subband41);subplot(6,6,10);imshow(subband42);subplot(6,6,11);imshow(subband43);subplot(6,6,12);imshow(subband44);
subplot(6,6,13);imshow(subband45);subplot(6,6,14);imshow(subband46);subplot(6,6,15);imshow(subband47);subplot(6,6,16);imshow(subband48);
subplot(6,6,17);imshow(subband51);subplot(6,6,18);imshow(subband52);subplot(6,6,19);imshow(subband53);subplot(6,6,20);imshow(subband54);
subplot(6,6,21);imshow(subband55);subplot(6,6,22);imshow(subband56);subplot(6,6,23);imshow(subband57);subplot(6,6,24);imshow(subband58);
subplot(6,6,25);imshow(subband59);subplot(6,6,26);imshow(subband5_10);subplot(6,6,27);imshow(subband5_11);subplot(6,6,28);imshow(subband5_12);
subplot(6,6,29);imshow(subband5_13);subplot(6,6,30);imshow(subband5_14);subplot(6,6,31);imshow(subband5_15);subplot(6,6,32);imshow(subband5_16);
