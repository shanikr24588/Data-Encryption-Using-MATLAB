# Data-Encryption-Using-MATLAB
Information is today's world’s undying currency. A great deal of private information are transmitted online including financial information and Social Security Numbers and it is important to keep that information safe. Out of the numerous methods to keep data safe the most thriving is data Encryption.Encryption is the act of encoding data to render it unintelligible to someone who doesn’t have the authorization to access the data. Once data is encrypted, only authorized parties who have a “key” can read it or use it. That is, if the encryption method is effective, it should completely protect data from unauthorized personnel.In this report, we are implementing a randomized encryption and decryption algorithm using matrices while studying and analyzing frequency characteristic graphs.
Two independent methods were employed to encrypt information that is given as an input by the user. The first method utilizes the concept of matrix multiplication 
to encrypt data and is very similar to the Hill Cipher algorithm. The second method employed is the very popular RSA algorithm. Both were implemented in 
MATLAB and are described below:

# MATRIX METHOD

The theory behind this encryption algorithm is quite simple. Every number, letter and special character (blank spaces included) are converted into a corresponding 
number and these numbers are then arranged into a matrix B. Another square, invertible, encryption matrix A that is compatible with the generated message matrix (in terms of multiplication) is used to encrypt the elements of the matrix B. By performing the matrix multiplication, A x B, a resultant matrix C is obtained, whose elements comprise the encrypted message. These elements may then be transmitted to the receiver, where they may again be decrypted to recover the original message. At the receiver end, the following operation may be carried out to recover the original signal B:
B = A^(-1)*C

# METHODOLOGY

Using the length of the input message signal, it was divided into a matrix of 4 columns and ‘a’ rows
Converting each letter of the message signal to its corresponding UNICODE value.
Created a randomized encryption matrix, using which we encrypt the input message signal
Storing of matrix values in a single row array
Finding the DFT and IDFT of the encrypted message
Plotting the magnitude and phase response graphs
Recovering the original message using inverse matrix multiplication

# RSA ALGORITHM

As mentioned before, the RSA Algorithm is a very popular asymmetric algorithm used to encrypt data. Consider a number ‘x’ has to be encrypted by this method. The algorithm generates two large prime numbers P1 and P2 that are relatively far apart. The product of these primes is calculated (designated P) and this value is stored for later use. A number ‘e’ is found such that the greatest common denominator (highest common factor) of ϕ and e is 1. Here, 
                                ϕ = (P1-1)(P2-1)
‘x’ is encrypted as: xencrypted = mod (xe,P) where the mod function calculates the remainder obtained when xeis divided by P. Another number ‘d’ (which is unique) is found such that mod (de, ϕ) equals 1. This number ‘d’ is the decryption key that is used by the receiver to decrypt the message. The encrypted message is decrypted by using the following equation:x = mod((xencrypted)^d, P)


# CONCLUSION

The fundamental concept of cryptography is that information can be encoded via an encryption scheme and decoded only by the individuals privy to the scheme. Various kinds of encryption schemes exist, ranging from uncomplicated to very complicated. The majority of such schemes are mathematical in nature. Here, the encoder is a matrix, and the decoder is the inverse of the same matrix
