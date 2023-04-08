%Nama : Muhammad Rafli Baihaqi
%Nim  : 2008541066
%Metode : Heun


clear all;
clc;
%% nilai parameter
x0=0;
y0=0;
t=1; % Nilai t dapat di rubah interval [0,1]
x2(1)=1;
y2(1)=-1;
xt=exp(-t);
yt=-exp(-t);
h=0.05;

n=round(abs((xt-x0)/h));
o=round(abs((yt-y0)/h));

%% solusi numerik
 for i=0:n
     x(i+1)=x0+i*h;
     y(i+1)=y0+i*h;
 end
% untuk x
for i=1:n
    p(i)= f(x(i),y(i)); % kemiringan fungsi awal
    x1(i)=x2(i)+h*p(i); % nilai awal
    pn(i)=f(x(i+1),x1(i)); % kemiringan akhir
    x2(i+1)= x2(i) + h/2*(p(i)+pn(i)); % nilai            
end

% untuk y
for i=1:n
    p(i)= g(x(i),y(i)); % kemiringan fungsi awal
    y1(i)=y2(i)+h*p(i); % nilai awal
    pn(i)=f(x(i+1),y1(i)); % kemiringan akhir
    y2(i+1)= y2(i) + h/2*(p(i)+pn(i)); % nilai            
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
    ex(i) = ((x2(i)-xe(i))/xe(i)); % nilai eror
end
for i=1:length(y)
    ey(i) = ((y2(i)-ye(i))/ye(i)); % nilai eror
end
%% hasil
hasil = [x; y; x2; y2; xe; ye; ex; ey];

%% Plot

%plot x
%plot(x,x2,x,xe,x,ex);
%legend('nilai x numerik','nilai x eksak', 'nilai x error');

%plot y
plot(y,y2,y,ye,y,ey);
legend('nilai y numerik','nilai y eksak','niali y error');


%% fungsi
function u=f(x,y,t)
u=x+2*y
end

function v=g(x,y,t)
v=3*x+y
end