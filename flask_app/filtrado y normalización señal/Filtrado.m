%%Comparando de Audio%%
close all;
clear all;%borra las variables del archivo%
clc;

Fs = 44100;

senal = audioread('hola.wav');
senal = senal/max(senal);

tiempo1 = (0:length(senal)-1)/Fs;
subplot(3,2,1),plot(tiempo1,senal);
    title('Audio a comparar');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
sound (senal,Fs);
pause

%%Transformada Fourier de señal Original%%
L = length(senal);

f = Fs*(0:(L/2))/L;

Y = fft(senal);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

subplot(3,2,3), plot(f,P1);
    title('Fourier Señal a Comparar');
    xlabel('f(Hz)');
    ylabel('P1(f)');
    
%%Filtro Diseñado 1%%
Fil = filter(FilHijo,senal);

LF = length(Fil);

fF = Fs*(0:(LF/2))/LF;

YF = fft(Fil);
P2F = abs(YF/LF);
P1F = P2F(1:LF/2+1);
P1F(2:end-1) = 2*P1F(2:end-1);

subplot(3,2,2), plot(fF,P1F);
    title('Fourier Audio Filtrado HIJO');
    xlabel('f(HZ');
    ylabel('P1(f)');
    
sound(Fil,Fs);
pause

%%Filtro Diseñado 2%%
Fil1 = filter(FilAle,senal);

LF1 = length(Fil1);

fF1 = Fs*(0:(LF1/2))/LF1;

YF1 = fft(Fil1);
P2F1 = abs(YF1/LF1);
P1F1 = P2F1(1:LF1/2+1);
P1F1(2:end-1) = 2*P1F1(2:end-1);

subplot(3,2,4), plot(fF1,P1F1);
    title('Fourier Audio Filtrado ALE');
    xlabel('f(HZ');
    ylabel('P1(f)');
    
sound(Fil1,Fs);

%%Filtro Diseñado 3%%
Fil2 = filter(FilHola,senal);

LF2 = length(Fil2);

fF2 = Fs*(0:(LF2/2))/LF2;

YF1 = fft(Fil2);
P2F1 = abs(YF1/LF2);
P1F1 = P2F1(1:LF2/2+1);
P1F1(2:end-1) = 2*P1F1(2:end-1);

subplot(3,2,6), plot(fF2,P1F1);
    title('Fourier Audio Filtrado HOLA');
    xlabel('f(HZ');
    ylabel('P1(f)');
    
sound(Fil2,Fs);
pause
