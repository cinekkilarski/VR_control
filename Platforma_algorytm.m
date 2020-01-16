clc
close all
clear all
%parametry silnika malej biezni
U=48; % Zasilanie 48VDC
I=17; % indukcyjnosc [gcm^2]
J=  0.95;    %moment bezwladnosci
Mo= 0;  % moment tarcia
R=U/I;   %rezystancja
grid on
axis([-100 100 -100 100])
[disp_x,disp_y] = getpts();




close
h=randi([5 20],1); %random hight

c='*g';
% Platforma_trajektoria(disp_x(1),disp_y(1),h,c);
[x, y ,z] = Platforma_trajektoria(disp_x(1),disp_y(1),h,c);
left_foot=[x; y ;z];
clear x y z t


c='*r';
% Platforma_trajektoria(disp_x(2),disp_y(2),h,c);
[x, y ,z]= Platforma_trajektoria(disp_x(2),disp_y(2),h,c);
right_foot=[x; y ;z];
clear x y z c


% if length(right_foot)<length(left_foot)
%     l=length(left_foot)-length(right_foot)
%  right_foot = [right_foot,zeros(1,l)];
% else
%      l=length(right_foot)-length(left_foot)
%  left_foot = [left_foot,zeros(1,l)];
% end

%    t=1:1:length( left_foot);
 s(1)= (right_foot(1,end)+left_foot(1,end))/2
 s(2)=(right_foot(2,end)+left_foot(2,end))/2
% 
%   s(1)= (disp_x(1)+disp_x(2))/2
%   s(2)=(disp_y(1)+disp_y(1))/2

figure
plot(right_foot(1,:),right_foot(2,:),...
    left_foot(1,:),left_foot(2,:),s(1),s(2),'*r');
grid on

%lewa noga-rpm i czas dla silnika
Fs=60;
dt=1/Fs;
Ts=2e-06;
t_l=length(right_foot)*dt  % sekund
v=s(2)/(t_l *100) %m/s
r1=-0.136; %m
w_x=((60*v*4.29)/r1)/(2*pi*10)
% w_l=v/(4.29*r1)
%prawa  noga-rpm i czas dla silnika

t_r=length(left_foot)*dt  % sekund
 v=s(1)/(t_r*100)   %m/s
r2=-0.04;
% w_r=v/(4.29*r2)
w_y=((60*v*4.29)/r2)/(2*pi*10)


%promien bebna 0.273m przekladna 4,29:1

