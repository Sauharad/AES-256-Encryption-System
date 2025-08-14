from Crypto.Cipher import AES
import binascii
import time

# Input and output file paths
input1_file = r"D:\Vivado\Projects\AES\AES.sim\sim_1\behav\xsim\tb_out.txt"
input2_file = r"D:\Vivado\Projects\AES\AES.sim\sim_1\behav\xsim\dut_out.txt"
output_file = r"D:\Vivado\Projects\AES\AES.sim\sim_1\behav\xsim\py_out.txt"

# Read all key-data pairs from input file
with open(input1_file, 'r') as f:
    lines = f.readlines()

ciphertexts = []

# Process each key and data pair
for i in range(0, len(lines), 2):
    key_line = lines[i].strip()
    data_line = lines[i+1].strip()

    # Extract hex strings from lines like: key=001122...
    key_hex = key_line.split('=')[1].strip()
    data_hex = data_line.split('=')[1].strip()

    key = bytes.fromhex(key_hex)
    data = bytes.fromhex(data_hex)

    # AES-256 encryption in ECB mode
    cipher = AES.new(key, AES.MODE_ECB)
    encrypted = cipher.encrypt(data)

    # Save hex result
    ct_hex = encrypted.hex()
    ciphertexts.append(ct_hex)

with open(input2_file, 'r') as f:
    lines2 = f.readlines()

with open(output_file,"w") as f:
    for i in range(0,len(lines2)):
        f.write("Golden Ciphertext: ")
        f.write(ciphertexts[i].strip())
        f.write('\n')
        f.write("DUT Ciphertext: ")
        f.write(lines2[i].strip())
        f.write('\n')
        if (ciphertexts[i].strip() == lines2[i].strip()):
            f.write('Output Verified')
            f.write('\n\n')



