clear; clc;

numg= 2.5399;
deng=[7.904^-6 7.78^-5 0.01508 0.06349 6.4510];
sys=tf(numg,deng);
step(sys)
impulse(sys)
t=0:0.01:5;
[y,t]=step(sys,t);
plot(t,y) % natural frequency of link
%%
[A,B,C,D]=tf2ss(numg,deng)% Convert tf into a ss equation for modeling
rlocus(sys)
p=pole(sys)
zeta = 0.07998;
wn = 6.25;
sgrid(zeta,wn)

k=1.1107 % determined from poles of rlocus plot
[k,poles] = rlocfind(sys)
sys_cl = feedback(k*sys,1)
step(sys_cl)