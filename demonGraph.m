function [demon_y,demon_x,demon_origin_y]=demonGraph(num1,num2)

demon_ima=getgraph('t10k-images.idx3-ubyte');
demon_lab=getlabel('t10k-labels.idx1-ubyte');
demon_x=demon_ima(:,num1:num2);
demon_origin_y=demon_lab(num1:num2,:);
temp=num2-num1+1;
demon_y=zeros(10,temp);
for i=1:temp
   
    k=demon_origin_y(i,1)+1;
    demon_y(k,i)=1;
end
for j=1:temp
    figure(j+1)
    pic=demon_x(:,j);
    pic=reshape(pic,28,28);
    pic=pic.*100;
    image(pic);
end

