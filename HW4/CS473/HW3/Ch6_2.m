clear all;


% Note, had to make changes to unimportable cells when importing data from
% dig_tra.txt, NaN columns and rows are excluded

%load dig_tra.txt = data

%coefficient matrix using pca
%data will hold matrix populated with data imported from dig_tra.txt;

coeff = pca(data);

disp("coeff =  coefficient matrix from pca function of data");

[V,D] = eig(coeff);

disp("V = eigenvectors of data from coefficient matrix derived from PCA");

%Run 'V' in CMD for eigenvectors of data

%reconstruciton code
ProjectedImages = [z1 z2] * [v1';v2'];
for i=1:N
    ProjectedImages(i,:)=ProjectedImages(i,:)+mm;
end;
mi=28;
tf=reshape(data(mi,:),8,8);subplot(2,1,1);contour(tf);
tfn=reshape(ProjectedImages(mi,:),8,8);subplot(2,1,2);contour(tfn);
err=(data(mi,:)-ProjectedImages(mi,:))*(data(mi,:)-ProjectedImages(mi,:))';