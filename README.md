# AES-256 RTL Encryption System

This project presents a Register-Transfer Level (RTL) hardware design and implementation of the **AES-256 encryption algorithm**, developed for high-throughput cryptographic applications. The system is modeled in Verilog and operates as a fully pipelined 15-stage encryption engine capable of processing 128-bit blocks at a throughput of **128 bits per cycle** at **240 MHz**.

---

## Overview

**Advanced Encryption Standard (AES-256)** is a symmetric block cipher standardized by NIST, known for its robustness and wide adoption in secure communication systems. This design implements AES-256 in compliance with the standard, employing a 256-bit key to encrypt 128-bit plaintext blocks over 14 full rounds and one initial round (15 stages total).

---

## Key Features

- **AES-256 Encryption**
  - 256-bit key
  - 128-bit plaintext block
  - 14 rounds + 1 initial AddRoundKey
- **AXI4-Stream Interface**
  - AXI4-Stream based input interface
- **Fully Pipelined Architecture**
  - 15-stage pipeline (one stage per encryption round)
  - 240 MHz clock frequency
  - 128-bit per-cycle throughput
- **Modular Design**
  - Separate **datapath** and **key expansion** modules
  - Integrated at top-level for synchronized operation

---

## Functional Components

### Encryption Pipeline

Each encryption round includes the following transformations:
- **SubBytes** – Byte-wise substitution using an S-box
- **ShiftRows** – Permutation of rows for diffusion
- **MixColumns** – Column-wise mixing using Galois field arithmetic
- **AddRoundKey** – Bitwise XOR of state with round key

The initial round applies only the AddRoundKey operation, and the final round omits MixColumns, as per AES standard.

### Key Expansion Unit

- Performs the AES-256 key schedule
- Expands the 256-bit cipher key into **15 round keys**
- Includes byte rotation, S-box substitution, and round constant addition

---

## Design Architecture

- **Encryption Datapath**: Processes the state through all AES rounds.
- **Key Generation Path**: Generates round keys from the original 256-bit key.
- **Top-Level Module**: Integrates datapath and key scheduler, managing synchronization across the pipeline.

---

## Performance

- **Clock Frequency**: 240 MHz
- **Throughput**: 128 bits per cycle (one 128-bit block every clock cycle after pipeline fill)
- **Latency**: 15 clock cycles (pipeline depth)

---

## Simulation and Verification

- The design has been verified using UVM-style SystemVerilog testbench with Driver, Monitor and Generator classes and random input.
- Correctness of encryption is verified by comparison to a golden reference AES 256 model implemented in Python with the pycryptodome library.
- Waveform analysis confirms accurate state transitions, key scheduling, and pipeline synchronization.

---

## Future Work

- **AES-256 Decryption Path**: Implementation of inverse operations and inverse key schedule
- **Mode Support**: Integration of CBC, CTR, or GCM modes for practical cryptographic usage
  
---

## References

- NIST FIPS 197 — *Advanced Encryption Standard (AES)*  
  https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197.pdf
