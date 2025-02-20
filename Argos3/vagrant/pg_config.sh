#!/usr/bin/env bash
echo "apt-get update and upgrade"
apt-get -qqy update && apt-get install
echo "Installing swapspace"
sudo apt-get -qqy install swapspace
echo "Disabling IPV6"
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
echo "Installing X11"
sudo apt-get install -qqy --reinstall xauth
sudo apt-get install -qqy xorg openbox x11-apps
echo "Update sshd to support X11"
sudo cp /vagrant/sshd_config /etc/ssh
sudo /etc/init.d/ssh restart
echo "Installing dos 2 unix"
sudo apt-get -qqy install dos2unix
echo "Installing Argos Simulator"
cp /vagrant/argos3_simulator-3.0.0-x86_64-beta48.deb ./
sudo dpkg -i argos3_simulator-3.0.0-x86_64-beta48.deb
echo "Installing Argos Simulator dependicies"
sudo apt-get -f -y install
sudo dpkg -i argos3_simulator-3.0.0-x86_64-beta48.deb
echo "Wrapping up"
vagrantTip="[35m[1mThe shared directory is located at /vagrant\\nTo access your shared files: cd /vagrant[m"
echo -e $vagrantTip > /etc/motd
echo "Done installing your virtual machine!"
echo "Don't forget to run dos2unix on build.sh"
