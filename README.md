# Docker Demo

In this demo, we explore Docker.
If you successfully navigate through the scenario below, you should be
able to interact with a containerized host to retrieve a question
from a web server. This will require you to configure three emulated BGP
peers.


## Container Topology

HOST --- ROUTING --- WEB_SERVER

## Emulated Network Topology
```
HOST --- R1 --- R2 --- WEB_SERVER
     	  | 	 |
	  ---R3---
```
R1, R2, R3 are eBGP peers emulated using Mininet.

## Addressing

- HOST is part of the 10.0.0.0/24 subnet.
- WEB_SERVER is part of the 12.0.0.0/24 subnet.
- R3 notionally has an interface connected to the 11.0.0.0/24 subnet.
- R1 is part of AS 4500, R2 of AS 55000, and R3 of AS 65000.

## Exercise 

In order to standardize our environment, we utilize a Vagrantfile.
Take a look at the provisioning section and try to understand what is happening.

- It installs `quagga`, a network routing software suite consisting of a
core daemon (`zebra`), which sets up a socket enabling Quagga clients to
communicate with the underlying Unix kernel using the ZServ API. The Quagga
client we configure in this exercise is `bgpd`, which implements the BGP
routing protocol and communicates BGP updates to the `zebra` daemon.

- It installs `mininet`,
a network emulator that uses process-based virtualization
in conjunction with Linux network namespaces to provide individual processes
with separate network interfaces, routing tables, and ARP tables. Note that
while this technique has the same basis as the mechanism underlying Docker,
Mininet does not implement the full Linux container architecture nor provide
full OS-level virutalization. Devices defined in Mininet are connected by
virtual ethernet (`veth`) pairs. Mininet also integrates OpenFlow to enable
highly flexible custom routing and Software-Defined Networking (SDN).
It also installs and configures the OpenVSwitch Controller to enable Mininet.

- It clones and installs our fork of the Containernet git repository.

- It sets up Docker.

To complete the exercise, perform the following tasks.
1) Write a Dockerfile that can retrieve content from a webserver.
2) Write a Dockerfile that implements a simple webserver.
3) Write a Python script that implements the architecture above using
Containernet and the Dockerfiles you wrote in the previous two steps. 