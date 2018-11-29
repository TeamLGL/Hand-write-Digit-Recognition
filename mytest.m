function[pred]= mytest(x_test,y_test,w,b,w_h,b_h)
%x_test:test samples pixel data
%y_test:test samples label
%w£ºweight of output layer
%b£ºbias of output layer
%w_h£ºweight of hidden layer
%b_h£ºbias of hidden layer
[~,testnum]=size(x_test);
test = zeros(10,testnum);
pred=zeros(1,testnum);
for k=1:testnum
    x = x_test(:,k);

    hid = layerout(w_h,b_h,x);
    test(:,k)=layerout(w,b,hid);

    
    [t,t_index]=max(test);
    [y,y_index]=max(y_test);
    sum = 0;
    for p=1:length(t_index)
        if t_index(p)==y_index(p)
            sum =sum+1;
        end
    end
    
    pred=t_index-1;
end
confi=sum./testnum;
fprintf(['Correctness: ',num2str(confi)]);

%plotconfusion matrix
figure()
plotconfusion(y_test,test);
end
