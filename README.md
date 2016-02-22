# randDNS
Choose 2 random DNS servers from a predefined list when the network is brought up

**Note This has only been tested on Debian Jessie. If you have a program that overrides 
resolv.conf then it may cause problems**

By default it will overwrite resolv.conf with 2 random servers based on the entries in the server list.
The config file is at `/etc/randdns/randdns.conf` and can be used to specify the location of the server 
list, the file to write the random servers to and whether to enable logging or not.

The server list supports comments and blank lines for readablility.

Pull requests are welcome.
