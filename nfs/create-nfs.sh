sudo apt-get update && sudo apt-get install -y nfs-kernel-server
sudo mkdir /opt/k3sstorage
sudo chmod 1777 /opt/k3sstorage/
sudo bash -c "echo '/opt/k3sstorage/ *(rw,sync,no_root_squash,subtree_check)' >> /etc/exports"
sudo exportfs -ra