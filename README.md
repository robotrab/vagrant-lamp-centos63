# LAMP stack setup based on CentOS 6.3 with Vagrant / Puppet

This installs:

- Apache
- PHP

## Installation

1. Install VirtualBox

	Download from [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads). Remember to download the VirtualBox Extension Pack.

2. Install Vagrant

	Download from [http://downloads.vagrantup.com](http://downloads.vagrantup.com/).

3. Clone this repo into a local folder

	```bash
$ git clone git@github.com:robotrab/vagrant-lamp-centos63.git phpdev
```

4. Start Vagrant

	`cd` into the checked out folder to start the VM:

	```bash
$ vagrant up
```
  If you get an error about mounting drives, try updating the virtualbox guest additions:

  ```bash
$ vagrant plugin install vagrant-vbguest
```

## Usage

Update your host operating system's `/etc/hosts` file with the entries from the file.
On Windows the hosts file is usually located in `C:\Windows\System32\drivers\etc`

domain_hosts_file.txt


To login into the VM type
```bash
$ vagrant ssh
```
On Windows you will need to use a program such as putty to access ssh.

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

## PuTTY config (Windows)
Download from [http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).
I recommend downloading PuTTY and PuTTYgen. This will allow you to create a private key so you do not need a password to login.
First open PuTTYgen. Then select Conversions and Import Key. The default location for the Vagrant key is located in:

C:\\Users\\*UserName*\\.vagrant.d\\insecure_private_key

Then hit save private key and save it anywhere. Then you can close out of PuTTYgen and open up PuTTY.

Create a new Session, save it whatever you want. For the host name use 127.0.0.1 and port number 2222. Then go to Connection SSH Auth. At the very bottom is a browse
button where you can add the new .ppk file you just created previously. Then save your session.

## Creating Vhosts

vhosts.rb will read in domains.json and create a vhost file for each domain listed according
to the template.conf.erb file. It will also create the associated folder in the clients folder and update the hosts file.

When adding a new site, you should add an entry to domains.json. Then rerun vhosts.rb.

## Attribution

Based on the excellent work from [Michael Cheng](https://github.com/miccheng/vagrant-lamp-centos63).
