clear all
clc
x=input('Enter the number to be encrypted');
e=0;d=0;prime1=0;prime2=0;
while (e==d)||(prime1==prime2)||(d==1)
 rand_int1=randi(5,1);
 rand_int2=randi(5,1);
 prime1=nthprime(rand_int1);
 disp('prime1 = ');
 disp(prime1);
 prime2=nthprime(rand_int2);
 disp('prime2 = ');
 disp(prime2);
 product_prime=prime1*prime2;
 disp('product_prime = ');
 disp(product_prime);
 phi=(prime1-1)*(prime2-1);
 disp('phi = ');
 disp(phi);
 allnumbers=1:100;%max range of e in the RSA algorithm
 e=allnumbers(gcd(phi,allnumbers)==1);
 disp('e = ');
 disp(e)
 length_e=length(e);
 e=e(2);% e is the RSA encryption key.
 disp('e = ');
 disp(e);
 allnumbers_2=1:phi;
 d=allnumbers_2(mod((allnumbers_2*e),phi)==1);
 disp('d = ');
 disp(d);
end
encrypted_number=mod(x^e,product_prime);
disp('Encrypted number is ');
disp(encrypted_number)
if encrypted_number<=product_prime
 while (e==d)||(prime1==prime2)||(d==1)
 rand_int1=randi(5,1);
 rand_int2=randi(5,1);
 prime1=nthprime(rand_int1);
 disp('prime1 = ');
 disp(prime1);
 prime2=nthprime(rand_int2);
 disp('prime2 = ');
 disp(prime2);
 product_prime=prime1*prime2;
 disp('product_prime = ');
 disp(product_prime);
 phi=(prime1-1)*(prime2-1);
 disp('phi = ');
 disp(phi);
 allnumbers=1:100;%max range of e in the RSA algorithm
 e=allnumbers(gcd(phi,allnumbers)==1);
 disp('e = ');
 disp(e)
 length_e=length(e);
 e=e(2);% e is the RSA encryption key.
 disp('e = ');
 disp(e);
 allnumbers_2=1:phi;
 d=allnumbers_2(mod((allnumbers_2*e),phi)==1);
 disp('d = ');
 disp(d);
 end
end
decrypted_number=mod(encrypted_number^d,product_prime);
disp('Decrypted number is ');
disp(decrypted_number)