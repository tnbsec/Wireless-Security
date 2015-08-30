Monitor Mode 
 
- By default, your wireless adapter is going to ignore any traffic if it was meant for someone else 
- When the girl next to you tries to login to her Facebook and the router sends back that data, our device won’t capture those packets 
- This normal mode is called ​managed ​mode 
- There is also a special mode called ​monitor ​mode which allows your card to capture all packets that get sent through the air doesn’t matter if they were meant for you or not 
 
Note: 
- Some wireless cards do not support monitor mode for obvious reasons 
- Also, other operating systems usually give you trouble 
- Use Kali, and make sure to find a USB wireless adapter that supports monitor mode 
 
----------------------------------

Enable monitor mode for your adapter 
 
# Disable card
ifconfig wlan0 down

# Create a new virtual wireless card with monitor mode enabled
airmon-ng start wlan0
 
# See that monitor mode is enabled
iwconfig
