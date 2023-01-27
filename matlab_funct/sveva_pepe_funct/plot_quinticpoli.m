
%% Plot quintic polynomial for rest2rest trajectory

T=3.69;
t=[0:0.1:T];

% quintic polynomial
q0=[deg2rad(49.83); deg2rad(69.51);]; 
qf=[deg2rad(162.66);deg2rad(102.12)]; 
dq=qf-q0;


%con v0,v1,a0,a1 =0;

% position
q1t=q0(1)+dq(1)*(6*(t/T).^5 -15*(t/T).^4+10*(t/T).^3);
q2t=q0(2)+dq(2)*(6*(t/T).^5 -15*(t/T).^4+10*(t/T).^3);

% velocity
q1v=dq(1)*((30/T)*(t/T).^4 -(60/T)*(t/T).^3+(30/T)*(t/T).^2);
q2v=dq(2)*((30/T)*(t/T).^4 -(60/T)*(t/T).^3+(30/T)*(t/T).^2);

% acceleration
q1a=dq(1)*( (120/T^2)*(t/T).^3 -(180/T^2)*(t/T).^2+(60/T^2)*(t/T) );
q2a=dq(2)*((120/T^2)*(t/T).^3 -(180/T^2)*(t/T).^2+(60/T^2)*(t/T));

%jerk
q1j = (dq(1)/(T^3))*(60 - (360*(t/T)) + (360 * (t/T).^2) );
q2j = (dq(2)/(T^3))*(60 - (360*(t/T)) + (360 * (t/T).^2) );


figure

subplot(2, 2, 1);
hold on; grid on;
title('position');
xlabel('[s]'); ylabel('[deg]')
plot(t, q1t); plot(t, q2t); 

subplot(2, 2, 2);
hold on; grid on;
title('velocity');
xlabel('[s]'); ylabel('[deg/s]')
legend()
plot(t, q1v); plot(t, q2v); 

subplot(2, 2, 3);
hold on; grid on;
title('accelleration');
xlabel('[s]'); ylabel('[deg/s^2]')
plot(t, q1a); plot(t, q2a); 

subplot(2, 2, 4);
hold on; grid on;
title('jerk');
xlabel('[s]'); ylabel('[deg/s^3]')
plot(t, q1j); plot(t, q2j); 
