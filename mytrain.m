function[w,b,w_h,b_h]=mytrain(x_train,y_train)
%train function:784-->hidden-->10
%x_train:training samples data
%y_train:training samples label
%w£ºweight of output layer
%b£ºbias of output layer
%w_h£ºweight of hidden layer
%b_h£ºbias of hidden layer
%step£ºnumber of iteration steps

step=300;
a=0.3;%learning factor
in = 784; %number of input neurons
hid = 28;%unmber of hidden neurons
out = 10; %number of output neurons
o =1;

w = randn(out,hid);
b = randn(out,1);
w_h =randn(hid,in);
b_h = randn(hid,1);


for i=0:step

    for j=1:6000
        x = x_train(:,j);
        y = y_train(:,j);

        hid_put = layerout(w_h,b_h,x);
        out_put = layerout(w,b,hid_put);

        %update function
        o_update = (y-out_put).*out_put.*(1-out_put);%delta out
        h_update = ((w')*o_update).*hid_put.*(1-hid_put);%delta hidden

        outw_update = a*(o_update*(hid_put'));
        outb_update = a*o_update;
        hidw_update = a*(h_update*(x'));
        hidb_update = a*h_update;

        w = w + outw_update;
        b = b+ outb_update;
        w_h = w_h +hidw_update;
        b_h =b_h +hidb_update;
    end
end  
end
