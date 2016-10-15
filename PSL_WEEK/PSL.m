clear all;
close all;
clc
syms x;
d1 = int(0.645*x + 19.5, x, 0, 10);
syms x;
d2 = int(-1.89*x + 44.85, x, 10, 15);
syms x;
d3 = int(0.6185*x + 7.169, x, 15, 19);
syms x;
d4 = int(-1.89*x + 54.858, x, 19, 20);
syms x;
d5 = int(0.645*x + 4.1577, x, 20, 24);
m = 1 * 9.8 * 1 * 9 * (d1 + d2 + d3 + d4 + d5);