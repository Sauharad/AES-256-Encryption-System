import os
import time
import subprocess

trigger_file = "D:\\Vivado\\Projects\\AES\\AES.sim\\sim_1\\behav\\xsim\\trigger.txt"
golden_script = "D:\\Vivado\\Projects\\AES\\AES.sim\\sim_1\\behav\\xsim\\golden.py"
done_file = r"D:\Vivado\Projects\AES\AES.sim\sim_1\behav\xsim\done.txt"
input1_file = r"D:\Vivado\Projects\AES\AES.sim\sim_1\behav\xsim\tb_out.txt"
input2_file = r"D:\Vivado\Projects\AES\AES.sim\sim_1\behav\xsim\dut_out.txt"
output_file = r"D:\Vivado\Projects\AES\AES.sim\sim_1\behav\xsim\py_out.txt"


print("[Watcher] Started. Waiting for trigger...")

if os.path.exists(done_file):
    os.remove(done_file)

if os.path.exists(input1_file):
    os.remove(input1_file)    

if os.path.exists(input2_file):
    os.remove(input2_file)

if os.path.exists(output_file):
    os.remove(output_file)

if os.path.exists(trigger_file):
    os.remove(trigger_file)

while True:
    if os.path.exists(trigger_file):
        print("[Watcher] Trigger detected. Running golden.py...")
        os.remove(trigger_file)
        subprocess.run([
            "C:\\Users\\Shaur\\AppData\\Local\\Programs\\Python\\Python311\\python.exe",
            golden_script
        ])
        print("[Watcher] Done.")
        exit(0)
    time.sleep(0.01)
