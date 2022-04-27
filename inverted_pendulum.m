clear, close all, clc;

%% Define system parameters
%Constants
m_p = 0.215;    %(kg)       Pendulum mass
m_c = 1.608;    %(kg)       Cart maxx
L   = 0.314;    %(m)        Effective pendulum half-length
I_o = 7.06e-3;  %(kg.m^2)   Pendulum moment of inertia about centre of mass
R   = 0.16;     %(ohm)      Motor terminal resistance
r   = 0.0184;   %(m)        Pinion radius
k_g = 3.71;     %(m/m)      Gearing ratio
k_m = 0.0168;   %(V.s/rad)  Motor back EMF constant
c   = 0;        %(N.s/m)    Damping on cart
g   = 9.81;     %(m/s^2)    Acceleration due to gravity

%Matricies
A3_2 = (-m_p^2*L^2*g)/((m_c + m_p)*I_o + m_c*m_p*L^2);
A3_3 = (I_o + m_p*L^2)*(c*R*r^2 + k_m^2*k_g^2)/(((m_c + m_p)*I_o + m_c*m_p*L^2)*R*r^2);
A4_2 = (m_c + m_p)*m_p*L*g/((m_c + m_p)*I_o + m_c*m_p*L^2);
A4_3 = -m_p*L*(c*R*r^2 + k_m^2*k_g^2)/(((m_c + m_p)*I_o + m_c*m_p*L^2)*R*r^2);

A = [0,   0,    1,    0;
     0,   0,    0,    1;
     0,   A3_2, A3_3, 0;
     0,   A4_2, A4_3, 0];
 
B3 = -(I_o + m_p*L^2)*k_m*k_g/(((m_c + m_p)*I_o + m_c*m_p*L^2)*R*r);
B4 = 
