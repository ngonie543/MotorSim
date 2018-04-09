%%Initialize workspace
clear
format short e

%%Load motor constants variables
MotorConstants1841

%%Defining Gpos
s=tf('s');
Gpos=Kt/((Jm*La)*s^3 +(Jm*Ra + La*Dm)*s^2 + (Ra*Dm + Kt* Kb)*s);

%%Plotting step response of the angular velocity of the motor,

figure(1)
tModel= linspace(0, 0.220, 1000);
eModel=(1).*(tModel>=0);
OmegaModel=lsim(s* Gpos, eModel, tModel);
plot(tModel, OmegaModel, 'k-');
ylabel('Angular Velocity (rad/s)')
title('Step Response of Velocity for Faulhaber 1841')
grid on
tOmega=0.632*max(OmegaModel) %Angular frequency at time constant value = 115.83 rad/s

%%Using MATLAB Data Cursor, time constant=0.02163s or 21.63ms

%for 6V nominal voltage
eModel6=(6).*(tModel>=0); %%for 6V nominal voltage
OmegaModel6=lsim(s* Gpos, eModel6, tModel);
figure(2)
plot(tModel, OmegaModel6, 'k-');  %% Yes the max is exactly 1100 rad/s
grid on
ylabel('Angular Velocity (rad/s)')
title('6V Step Response of Velocity for Faulhaber 1841')
grid on


figure(3);
clf
NP=1000; AMP=6; T=0.4; DC=0.5;
tModel = linspace(0, 1.2, NP);
eModel = AMP*(mod(tModel, T)<(DC*T));
OmegaModel = lsim(s * Gpos, eModel, tModel);
subplot(2,1,1)
plot(tModel, OmegaModel, 'k-')
axis([0.0 1.2 0.0 1.1*max(OmegaModel)])
xlabel('Time (s)'); ylabel('Angular Velocity (rad/s)') 
title('Pulse Train Response of Velocity for Faulhaber 1841') 
subplot(2,1,2)
plot(tModel, eModel, 'k-')
axis([0.0 1.2 -1.0 7.0])
xlabel('Time (s)'); ylabel('Input Voltage (V)')









