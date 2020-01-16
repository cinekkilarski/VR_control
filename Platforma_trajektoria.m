
function [x, y ,z]= Platforma_trajektoria(disp_x,disp_y,h,c)
%input values

%workspace=zeros(200);
%disp= input('Ruch lewej stopy w metrach: ')
% disp_in=0.2; %m
% disp=disp_in*100; % cm

disp=sqrt(disp_x.^2+disp_y.^2)/2;


if disp_x>=0  && disp_y>=0
    orientation=1 % first quarter
elseif disp_x<0  && disp_y>=0
    orientation=2 % second quarter
elseif disp_x<0  && disp_y<0
    orientation=3% third quarter
elseif disp_x>=0  && disp_y<0
    orientation=4 % fourth quarter
end

switch orientation
    case 1
        d=disp_y/(2*disp);
        rad=  asin(d) %calculated from trigonometric function
        alpha=rad2deg(rad)
    case 2
        d=(disp_x)/(2*disp);
        rad=-asin(d)+pi/2
        alpha=rad2deg(rad)+90
    case 3
        d=(disp_x)/(2*disp);
        rad=asin(d)-pi/2
        alpha=rad2deg(rad)
    case 4
        d=(disp_x)/(2*disp);
        rad=-pi/2+ asin(d)
        alpha=rad2deg(rad)
end

% definition of trajectory
length_of_move= 0:5/(disp):pi;
x= -(disp*cos(length_of_move)-disp)/1.4417;
z = h*sin(length_of_move);
y=x;
v = [x;y];
theta = rad- 0.7854;
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
so = R*v;           % apply the rotation about the origin
x= so(1,:);
y= so(2,:);

%animation
for i=1:length(length_of_move)
  
    plot3(x(i),y(i),z(i),c);
    %plot(x(i),y(i),'*g');
    axis([-100 100 -100 100 0 50])
    line([0 0], ylim);
    line([0 0], xlim);
    grid on
    hold on;
    pause(0.04);
    xlabel('Os X');
    ylabel('Os Y');
    zlabel('Os Z');
    rotate3d on
end
end