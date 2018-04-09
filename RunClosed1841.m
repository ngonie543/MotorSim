%%Initialize workspace
clear
format short e

%%Load global variables
MotorConstants1841

%%Opening Simulink Model
ModelName='ClosedLoopMotor';
open_system(ModelName);



%%Changing values
set_param([ModelName  '/DesSpeedFcn'], 'Expression', '100*u')
set_param([ModelName '/KP'], 'Gain', '10')
save_system(ModelName)

%%Run simulation
sim(ModelName)


%%Need code to generate plot here
figure(1)
plot(t,Omega, 'k-')
title('Shaft Speed vs Time for 1841')
ylabel('Angular Speed (rad/s)')
xlabel('Time(s)')

figure(2)
plot(t,OmegaDes, 'k-')
title('Output of the Motor using gain control')
ylabel('Angular Speed (rad/s)')
xlabel('Time(s)')

ess=(OmegaDes(end) - Omega(end))/OmegaDes(end)




% I adhered to the community standard in writing this script: njn7




