# K8s code Server

Humble sparse time project for running code server in k3s multi node cluster on raspberry pi 4

## Docker file

Based in official node 18 image with Alpine 3.15
It installs python3 and other dependencies as official code server documentation states for npm based installations
Had dependencies installed, then npm is set up and code server is installed

## K8s deployment

As part of the project, NFS server is put in place into the cluster to provide persistent storage for the k3s multi node cluster
Having the NFS server in place and successfully tested, an 8 GB NFS Persistent Volume is declared and added to the cluster.
Then, a 4 Gb Volume Claim is declared for code server data persistence.

K3s ships with the local path storage provisioner, which uses storage local to the node.
If you want storage that can be shared across multiple nodes if you are running them, you will need to use a
different solution which the NFS storage provisioner is one of them. More information can be found in the following link:

https://www.phillipsj.net/posts/k3s-enable-nfs-storage/

 


