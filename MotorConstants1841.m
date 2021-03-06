%%Initialize workspace
clear
format short e



%global variables
global Jm Dm Kt Kb La Ra Kn Kemf Ktach

%Values for global variables
Jm=0.85* (1/1000) * (1/100)^2;
Dm=90.9 * 10^-9;
Kt=5.30 * (1/1000);
Kb=0.555 * (1/1000)*1/(2*pi/60);
La=200* 10^-6;
Ra=9.1;
Kn=1800 *2*pi/60;
Kemf= 9.55*(1/1000);
Ktach=1/(Kemf*Kn);