%%Initialize workspace
clear
format short e

%%Load global variables
MotorConstants1624

%%Opening Simulink Model
ModelName='OpenLoopMotor';
open_system(ModelName);

%%Changing values
set_param([ModelName  '/DesSpeedFcn'], 'Expression', '100')
save_system(ModelName)

%%Run simulation
sim(ModelName)


%%Need code to generate plot here
plot(t,Omega, 'k-')
title('Shaft Speed vs Time for 1624')
ylabel('Angular Speed (rad/s)')
xlabel('Time(s)')