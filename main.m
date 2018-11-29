train_ima=getgraph('train-images.idx3-ubyte');
train_lab=getlabel('train-labels.idx1-ubyte');
test_ima=getgraph('t10k-images.idx3-ubyte');
test_lab=getlabel('t10k-labels.idx1-ubyte');
%%
% x_train=train_ima(:,1:4000);
x_train=train_ima(:,1:6000);
y_train=zeros(10,6000);
for i=1:6000
    k=train_lab(i,1)+1;
    y_train(k,i)=1;
end
%x_test=train_ima(:,4001:5000);
x_test=test_ima(:,1:1000);
y_test=zeros(10,1000);
for i=1:1000
   
    k=test_lab(i,1)+1;
    y_test(k,i)=1;
end
%%
[w1,b1,w_h1,b_h1]=mytrain(x_train,y_train);
%%


pred1=mytest(x_test,y_test,w1,b1,w_h1,b_h1);

%
%%
% pic1=imread('seven.jpg');
% pic1=rgb2gray(pic1);
% image(pic1)
% pic1=reshape(pic1,28*28,1);
% pic1=normalize(pic1,'range');
% % %pic1=(round(pic1.*10))./10;
% % pic2=pic1.*100;
% % pic2=reshape(pic2,28,28);
% % image(pic2);
% % pic1=round(pic1);
% for i=1:784
%     if pic1(i,1)<=0.1
%         pic1(i,1)=0;
%     end
% end
% pic2=pic1.*100;
% pic2=reshape(pic2,28,28);
% image(pic2);
% pic1=round(pic1);       
% y_test=zeros(10,1);
% y_test(7,1)=1;
% 
% pred=mytest(pic1,y_test,w1,b1,w_h1,b_h1);

%%



[y_demon,x_demon,c]=demonGraph(3,10);
x_test=x_demon;

y_test=y_demon;
originallabel=c;

pred_test=mytest(x_test,y_test,w1,b1,w_h1,b_h1);


