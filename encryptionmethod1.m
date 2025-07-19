clear all
close all
clc
msg=input('Enter the message to be encrypted','s');%Takes a string input
disp('Length of message');
disp(length(msg));
%% Message encryption
if(mod(length(msg),4)>0)
 a=ceil((length(msg))/4);
else
 a=length(msg)/4;
end 
msg_matrix=zeros(a,4);
for p=1:length(msg)
 msg_matrix(p)=double(msg(p));%Each letter gets converted to its unicode value
end
disp('Message matrix');
disp(msg_matrix);
msg_arr=reshape(msg_matrix,1,[]);
encryption_matrix=rand(a,a);
while det(encryption_matrix)==0
 encryption_matrix=rand(a,a);
end
disp('Encryption matrix');
disp(encryption_matrix);
encrypted_msg=encryption_matrix*msg_matrix;
encrypted_msg_arr=reshape(encrypted_msg,1,[]);%Converts matrix to a row array
disp('Encrypted Message matrix');
disp(encrypted_msg);
disp('Encrypted Message array');
disp(encrypted_msg_arr);
%% Finding the DFT of the Encrypted Message
range_msg = 0:1:(length(msg_arr)-1);%Defining range to plot necessary graphs
N=length(encrypted_msg_arr);
c=0:1:(N-1);
X_k=zeros(1,N);%Initializing DFT sequence array
IX_n=zeros(1,N);%Initializing IDFT sequence array
for k=0:(N-1)
 for n=0:(N-1)
 X_k(k+1)=X_k(k+1)+((encrypted_msg_arr(n+1))*exp(-2i*pi*k*n/N));
 end
end
disp('Discrete Fourier Transform of Encrypted Message');
disp(X_k);
%% Finding the IDFT
for n=0:(N-1)
 for k=0:(N-1)
 IX_n(n+1)=IX_n(n+1)+((1/N)*((X_k(k+1)*exp(2i*pi*k*n/N))));
 end
end
disp('Inverse Discrete Fourier Transform');
disp(IX_n);
%% Plotting frequency characteristics of the encrypted signal
subplot(2,2,1);
stem(range_msg,msg_arr);
xlabel('n');
ylabel('Amplitude');
title('Message Signal');
subplot(2,2,2);
stem(c,encrypted_msg_arr);
xlabel('n');
ylabel('Amplitude');
title('Encrypted signal');
subplot(2,2,3);
stem(c,abs(X_k));
xlabel('k');
ylabel('Magnitude of X_k');
title('Magnitude characteristics of encrypted signal');
subplot(2,2,4);
stem(c,(angle(X_k)*180/pi));
xlabel('k');
ylabel('Phase of X_k');
title(' Phase characteristics of encrypted signal ');
%% Message Decryption and Recovery
encryption_matrix_inv=inv(encryption_matrix);
disp('Inverse of Encryption matrix');
disp(encryption_matrix_inv);
orig_msg=encryption_matrix_inv * encrypted_msg;
disp('Recovered message matrix');
disp(orig_msg);
orig_msg_arr=reshape(orig_msg,1,[]);
orig_msg_arr=round(orig_msg_arr,0);
disp('Recovered Message');
disp(char(orig_msg_arr));
