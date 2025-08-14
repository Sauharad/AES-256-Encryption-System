# Define the differential clock input pins
set_property PACKAGE_PIN R3 [get_ports SYSCLK_P]
set_property PACKAGE_PIN P3 [get_ports SYSCLK_N]

# Set both pins to LVDS standard
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_N]

# Create a 200 MHz clock
create_clock -period 4.1 -name clk_243MHz -waveform {0 2.05} [get_ports SYSCLK_P]




