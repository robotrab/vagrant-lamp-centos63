# LAMP stack setup based on CentOS 6.3 with Vagrant / Puppet

This installs:

- Apache
- PHP

## Installation

1. Install VirtualBox

	Download from [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads). Remember to download the VirtualBox Extension Pack.

2. Install Vagrant

	Download from [http://downloads.vagrantup.com](http://downloads.vagrantup.com/).

vagrant plugin install vagrant-vbguest

3. Clone this repo into a local folder

	```bash
$ git clone git@github.com:miccheng/vagrant-lamp-centos63.git phpdev
```

4. Start Vagrant

	`cd` into the checked out folder to start the VM:

	```bash
$ vagrant up
```

## Usage

Update your host operating system's `/etc/hosts` file with the entries from the file
On Windows usually located in `C:\Windows\System32\drivers\etc`
domain_hosts.txt


To login into the VM type
```bash
$ vagrant ssh
```

To stop the VM:
```bash
$ vagrant suspend
```

To halt the VM:
```bash
$ vagrant halt
```

To destroy the VM:
```bash
$ vagrant destroy
```

## Attribution

Based on the excellent work from [Michael Cheng](https://github.com/miccheng/vagrant-lamp-centos63).
