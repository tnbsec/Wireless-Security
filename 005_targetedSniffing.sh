Targeted sniffing 
 
We usually only want to target one network 
 
# Find the channel you want to target
airodump-ng mon0  
 
airodump-ng --channel <#> --bssid <MAC ADDRESS> --write <FILENAME> mon0
airodump-ng --channel 1 --bssid F0:7B:CB:5D:75:C2 --write first-capture mon0
 
- Top section is information about that AP 
- Bottom section is information about the clients, any devices (phones, laptops, etc...) connected to that AP 
  - BSSID ­ MAC address for that networks access point 
  - STATION ­ MAC address of that device 
  - Frames ­ number of packets that we collected from that device 
 
Ctrl + C to stop sniffing 
 
- Places > Home Folder 
  - Saved the sniffing data to a couple different file formats

- Right­click .cap file > Open in Wireshark 
  - We can see that packets, but they are all encrypted (for now)
