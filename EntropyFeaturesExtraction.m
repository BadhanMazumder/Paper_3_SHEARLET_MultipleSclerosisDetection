clc;
close all;
%-------------------------------Read MRI Image-------------------------------
ref_im= imread('NonMS (1).TIF');
offset =1;
for a_iter=1:100
trgt_im=imread(sprintf('NonMS (%d).TIF',offset));

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
subband21=dst{2}(:,:,1);
subband22=dst{2}(:,:,2);
%------------------------Layer3------------------------
subband31=dst{3}(:,:,1);
subband32=dst{3}(:,:,2);
subband33=dst{3}(:,:,3);
subband34=dst{3}(:,:,4);
%------------------------Layer4------------------------
subband41=dst{4}(:,:,1);
subband42=dst{4}(:,:,2);
subband43=dst{4}(:,:,3);
subband44=dst{4}(:,:,4);
subband45=dst{4}(:,:,5);
subband46=dst{4}(:,:,6);
subband47=dst{4}(:,:,7);
subband48=dst{4}(:,:,8);
%------------------------Layer5------------------------
subband51=dst{5}(:,:,1);
subband52=dst{5}(:,:,2);
subband53=dst{5}(:,:,3);
subband54=dst{5}(:,:,4);
subband55=dst{5}(:,:,5);
subband56=dst{5}(:,:,6);
subband57=dst{5}(:,:,7);
subband58=dst{5}(:,:,8);
subband59=dst{5}(:,:,9);
subband5_10=dst{5}(:,:,10);
subband5_11=dst{5}(:,:,11);
subband5_12=dst{5}(:,:,12);
subband5_13=dst{5}(:,:,13);
subband5_14=dst{5}(:,:,14);
subband5_15=dst{5}(:,:,15);
subband5_16=dst{5}(:,:,16);

%-------------------------------Display NSST Subbands-------------------------------

%figure,
%subplot(6,6,1);imshow(out_im);subplot(6,6,2);imshow(subband11);subplot(6,6,3);imshow(subband21);subplot(6,6,4);imshow(subband22);
%subplot(6,6,5);imshow(subband31);subplot(6,6,6);imshow(subband32);subplot(6,6,7);imshow(subband33);subplot(6,6,8);imshow(subband34);
%subplot(6,6,9);imshow(subband41);subplot(6,6,10);imshow(subband42);subplot(6,6,11);imshow(subband43);subplot(6,6,12);imshow(subband44);
%subplot(6,6,13);imshow(subband45);subplot(6,6,14);imshow(subband46);subplot(6,6,15);imshow(subband47);subplot(6,6,16);imshow(subband48);
%subplot(6,6,17);imshow(subband51);subplot(6,6,18);imshow(subband52);subplot(6,6,19);imshow(subband53);subplot(6,6,20);imshow(subband54);
%subplot(6,6,21);imshow(subband55);subplot(6,6,22);imshow(subband56);subplot(6,6,23);imshow(subband57);subplot(6,6,24);imshow(subband58);
%subplot(6,6,25);imshow(subband59);subplot(6,6,26);imshow(subband5_10);subplot(6,6,27);imshow(subband5_11);subplot(6,6,28);imshow(subband5_12);
%subplot(6,6,29);imshow(subband5_13);subplot(6,6,30);imshow(subband5_14);subplot(6,6,31);imshow(subband5_15);subplot(6,6,32);imshow(subband5_16);

%-------------------------------Entropy Feature Extraction%-------------------------------

%------------------------Shanon Entropy%------------------------
SEsub1=wentropy(subband21,'shannon');SEsub2=wentropy(subband22,'shannon');
SEsub3=wentropy(subband31,'shannon');SEsub4=wentropy(subband32,'shannon');
SEsub5=wentropy(subband33,'shannon');SEsub6=wentropy(subband34,'shannon');
SEsub7=wentropy(subband41,'shannon');SEsub8=wentropy(subband42,'shannon');
SEsub9=wentropy(subband43,'shannon');SEsub10=wentropy(subband44,'shannon');
SEsub11=wentropy(subband45,'shannon');SEsub12=wentropy(subband46,'shannon');
SEsub13=wentropy(subband47,'shannon');SEsub14=wentropy(subband48,'shannon');
SEsub15=wentropy(subband51,'shannon');SEsub16=wentropy(subband52,'shannon');
SEsub17=wentropy(subband53,'shannon');SEsub18=wentropy(subband54,'shannon');
SEsub19=wentropy(subband55,'shannon');SEsub20=wentropy(subband56,'shannon');
SEsub21=wentropy(subband57,'shannon');SEsub22=wentropy(subband58,'shannon');
SEsub23=wentropy(subband59,'shannon');SEsub24=wentropy(subband5_10,'shannon');
SEsub25=wentropy(subband5_11,'shannon');SEsub26=wentropy(subband5_12,'shannon');
SEsub27=wentropy(subband5_13,'shannon');SEsub28=wentropy(subband5_14,'shannon');
SEsub29=wentropy(subband5_15,'shannon');SEsub30=wentropy(subband5_16,'shannon');

%------------------------Log Energy Entropy%------------------------
LEEsub1=wentropy(subband21,'log energy');LEEsub2=wentropy(subband22,'log energy');
LEEsub3=wentropy(subband31,'log energy');LEEsub4=wentropy(subband32,'log energy');
LEEsub5=wentropy(subband33,'log energy');LEEsub6=wentropy(subband34,'log energy');
LEEsub7=wentropy(subband41,'log energy');LEEsub8=wentropy(subband42,'log energy');
LEEsub9=wentropy(subband43,'log energy');LEEsub10=wentropy(subband44,'log energy');
LEEsub11=wentropy(subband45,'log energy');LEEsub12=wentropy(subband46,'log energy');
LEEsub13=wentropy(subband47,'log energy');LEEsub14=wentropy(subband48,'log energy');
LEEsub15=wentropy(subband51,'log energy');LEEsub16=wentropy(subband52,'log energy');
LEEsub17=wentropy(subband53,'log energy');LEEsub18=wentropy(subband54,'log energy');
LEEsub19=wentropy(subband55,'log energy');LEEsub20=wentropy(subband56,'log energy');
LEEsub21=wentropy(subband57,'log energy');LEEsub22=wentropy(subband58,'log energy');
LEEsub23=wentropy(subband59,'log energy');LEEsub24=wentropy(subband5_10,'log energy');
LEEsub25=wentropy(subband5_11,'log energy');LEEsub26=wentropy(subband5_12,'log energy');
LEEsub27=wentropy(subband5_13,'log energy');LEEsub28=wentropy(subband5_14,'log energy');
LEEsub29=wentropy(subband5_15,'log energy');LEEsub30=wentropy(subband5_16,'log energy');

%-------------------------------Feature Export-------------------------------
TestingDataSet=[SEsub1,SEsub2,SEsub3,SEsub4,SEsub5,SEsub6,SEsub7,SEsub8,SEsub9,SEsub10,SEsub11,SEsub12,SEsub13,SEsub14,SEsub15,SEsub16,SEsub17,SEsub18,SEsub19,SEsub20,SEsub21,SEsub22,SEsub23,SEsub24,SEsub25,SEsub26,SEsub27,SEsub28,SEsub29,SEsub30,LEEsub1,LEEsub2,LEEsub3,LEEsub4,LEEsub5,LEEsub6,LEEsub7,LEEsub8,LEEsub9,LEEsub10,LEEsub11,LEEsub12,LEEsub13,LEEsub14,LEEsub15,LEEsub16,LEEsub17,LEEsub18,LEEsub19,LEEsub20,LEEsub21,LEEsub22,LEEsub23,LEEsub24,LEEsub25,LEEsub26,LEEsub27,LEEsub28,LEEsub29,LEEsub30];
    excelfile= 'EntropyFeatures.xlsx';
    xlswrite(excelfile,TestingDataSet,'NonMS',sprintf('A%d',offset));
	offset=offset+1;
end