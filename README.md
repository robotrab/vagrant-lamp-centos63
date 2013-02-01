# Web in a box setup based on CentOS 6.3 with Vagrant / Puppet

This installs:

- Apache
- MySQL
- PHP
- phpMyAdmin

## Installation

1. Install VirtualBox

	Download from [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads). Remember to download the VirtualBox Extension Pack.

2. Install Vagrant
	
	Download from [http://downloads.vagrantup.com](http://downloads.vagrantup.com/).

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

Update your host operating system's `/etc/hosts` file with the following entry:

```bash
192.168.56.60 phpdev.local
```

Now, you can reach the webroot with `http://phpdev.local` or `http://localhost:8080`.

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

The phpMyAdmin URL: `http://phpdev.local/phpmyadmin` or `http://localhost:8080/phpmyadmin`.

***Note:*** The MySQL username is `root`. There is no password specified for the MySQL root user. To secure it, you might want to SSH into the VM and run `mysql_secure_installation`.

## Attribution

Based on the excellent work from [Patrick Daether](https://github.com/pdaether/LAMP-CentOS-with-Vagrant).