%Nama : Muhammad Rafli Baihaqi
%Nim  : 2008541066
%Metode : RK


clear all;
clc;
%% nilai parameter
x0=0;
y0=0;
t=0.1; % Nilai t dapat di rubah interval [0,1]
x1(1)=1;
y1(1)=-1;
xt=exp(-t);
yt=-exp(-t);
h=0.05;

n=round(abs((xt-x0)/h));
m=round(abs((yt-y0)/h));

%% Solusi Numerik
for i=0:n
     x(i+1)=x0+i*h;
     y(i+1)=y0+i*h;
end

for i = 1:n
    x1(i+1)=x1(i)+h*f(x(i),y(i))  
end

for i = 1:n
    y1(i+1)=y1(i)+h*f(x(i),y(i))  
end
 
%% sulusi eksak
for i=1:length(x)
    xe(i) = exp(-x(i)); % nilai eksak x
end
for i=1:length(y)
    ye(i) = -exp(-y(i)); % nilai eksak y
end


%% Nilai Error
for i=1:length(y)
    ex(i) = ((x1(i)-xe(i))/xe(i)); % nilai eror
end
for i=1:length(y)
    ey(i) = ((y1(i)-ye(i))/ye(i)); % nilai eror
end

hasil = [x; y; x1; y1; xe; ye; ex; ey];

plot(x,x1,x,xe,x,ex);
legend('nilai x numerik','nilai x eksak', 'nilai x error');

%plot(y,y1,y,ye,y,ey);
%legend('nilai y numerik','nilai y eksak','niali y error');


%% fungsi
function u=f(x,y,t)
u=x+2*y
end

function v=g(x,y,t)
v=3*x+y
end