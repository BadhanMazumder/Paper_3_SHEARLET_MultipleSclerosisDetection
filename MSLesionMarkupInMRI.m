load('IM_00016_1.plq','-mat');
a=imread('IM_00016.tif');
figure, imshow(a),
hold on,
plot(yi,xi,'g', 'LineWidth', 3),
load('IM_00016_2.plq','-mat');
plot(yi,xi,'g', 'LineWidth', 3), 
load('IM_00016_3.plq','-mat');
plot(yi,xi,'g', 'LineWidth', 3),
hold off;