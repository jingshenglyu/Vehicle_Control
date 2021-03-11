% test.m

clear all;
clc;

crgmainpath = '/Users/eason/Downloads/Fahrzeugregelung/FaRe_II/Projekt/Projektdateien/OpenCRG.1.0.6'; % Hier vollst�ndigen Pfad zu: ...\OpenCRG.1.0.6\matlab\lib Verzeichnis angeben
addpath(genpath(crgmainpath));

slalom = crg_read('Slalom_3x18m.crg');
x = slalom.rx;
y = slalom.ry;
plot(x,y)