# EmonCMS Install Scripts

## Introduction

This build script can be used to build a fully fledged emoncms installation on debian based operating systems, including: installation of LAMP server and related packages, redis, mqtt, emoncms core, emoncms modules, and if applicable, emonhub & raspberrypi support for serial port, and WiFi access point.

The script is a series of scripts that install each required component. To see what is installed and how open each script.

As at 7 Oct 19 - Tested on:

- [Raspbian Buster Lite](https://www.raspberrypi.org/downloads/raspbian/), Release date: 2019-07-10
- Ubuntu 1804 LTS

[**Forum:** EmonSD build script progress update and beta release](https://community.openenergymonitor.org/t/emonsd-build-script-progress-update-and-beta-release/11222)

## Base OS Preparation

### RaspberryPi

To install onto a RaspberryPi, a number of tasks are required. Please follow [this instruction first](rpi-install.md).

### Ubuntu

For Ubuntu, post base OS install, run this command so the user does not need a password for `sudo`.

```shell
sudo echo $USER' ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/$USER && sudo chmod 0440 /etc/sudoers.d/$USER
```

### Digital Ocean Droplet

For installation on a Digital Ocean Droplet, follow [this instruction](digital-ocean-install.md).

## Install the EmonCMS Installation Scripts

Pull the init script from GitHub (note if you wish to pull the script from `master` change the path).

```shell
wget https://raw.githubusercontent.com/openenergymonitor/EmonScripts/stable/install/init.sh
chmod +x init.sh && ./init.sh
```

To use the `master` branch for **all** repositories use the command;

```shell
chmod +x init.sh && ./init.sh master
```

The `init` script automatically calls the `main` script. At this point you will be offered the option to configure the installation process.

If you are on a RaspberryPi or EmonPi you can usually just proceed.

If you wish to change any repository to master or change any other configuration, then edit the `config.ini` file.

The Install process does takes sometime.

## Post Install - Settings

If you have used EmonCMS before you may need to edit the settings to suit your local setup. This is now an `ini` file called `settings.ini` in `/var/www/emoncms/`.

## Post Install - First Use

To access EmonCMS go to the IP of your machine in your browser.  This [Guide](https://guide.openenergymonitor.org/setup/connect/) will help you set your system up.

At the initial user screen, you need to select **Register** and create a user - this will be the admin user.

If you are migrating from an old system, Export your data from the old system and Import the data to the new system (after registering a user). This will then require you to login as the original user.

## Configure install

The default configuration is for the RaspberryPi platform and Raspbian Buster image specifically. To run the installation on a different distribution, you may need to change the configuration to reflect the target environment.

To edit the configuration (standard file paths):

```shell
cd /opt/openenergymonitor/EmonScripts/install/
nano config.ini
```

To restart the installation:

```shell
./main.sh
```

See explanation and settings in installation configuration file here: [config.ini](emonsd.config.ini)

## Run Scripts Individually

It is possible to run the [scripts individually](install-scripts.md) for a single part of the stack. These are not guaranteed to be a complete solution (some folders may not be created for instance).

## Standard Setup Filepaths

Install location for code from OpenEnergyMonitor GitHub repository such as EmonScripts `/opt/openenergymonitor`

Install location for modules symlinked to www `/opt/emoncms`

Main code location `/var/www/emoncms`

Log file location `/var/log/emoncms`

Data directory `/var/opt/emoncms`
