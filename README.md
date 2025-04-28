# AES-256-Encryption-System

This project is an RTL design of an AES-256 encrpytion system.
Advanced Encryption Standard (AES) - 256 has been one of the most secure data encryption algorithms for many years.

In this algorithm, a 256 bit key is used to encrypt 128 bit data across 15 rounds of encryption. 
The 256 bit key is processed by a key scheduling system that converts it into round keys for each round of encryption.
These keys are used to encrypt the data in each round.

Each round of encrpytion consists of addition, shifting and substitution operations, namely AddRoundKey, SubBytes, ShiftRows and MixColumns.

The key scheduling consists of similar rotation and substitution operations being performed on the encryption keys.

The system designed here has been divided into the encryption datapath and the key generation path, which have been connected in the top level module.
It is a 15 stage pipeline that operates on a 240MHz clock signal with a throughput of 128 bits per cycle. Each stage in the pipeline corresponds to one round of encryption
