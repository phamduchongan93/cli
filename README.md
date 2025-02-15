# @treehouses/cli

[![Build Status](https://travis-ci.org/treehouses/cli.svg?branch=master)](https://travis-ci.org/treehouses/cli)
[![npm version](https://badge.fury.io/js/%40treehouses%2Fcli.svg)](https://www.npmjs.com/package/%40treehouses%2Fcli)
[![npm](https://img.shields.io/npm/dw/@treehouses/cli)](https://www.npmjs.com/package/%40treehouses%2Fcli)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/treehouses/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## About

@treehouses/cli is a command-line interface for Raspberry Pi that is used to manage various services and functions.
Including vnc, ssh, tor, vpn, networking, starting services, bluetooth, led lights, and much more!
Also [treehouses remote](https://github.com/treehouses/remote) uses this interface. 

## Install

@treehouses/cli comes pre-installed on the treehouses image made with [builder](https://github.com/treehouses/builder).
To manually install on a Pi:
```bash
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt-get install -y nodejs
sudo npm i -g --unsafe-perm @treehouses/cli
```
If you run into any problems check if your RPi is supported [here](https://github.com/treehouses/cli/blob/836c2e9b0bcebfe6afc97706634e7c070d795eac/modules/detect.sh#L5-L42).

## Features

```
Usage: treehouses [command] ...


Commands:

help [command]                            gives you a more detailed info about the command or will output this
verbose <on|off>                          makes each command print more output (might not work with treehouses remote)
expandfs                                  expands the partition of the RPI image to the maximum of the SDcard
rename <hostname>                         changes hostname
password <password|disable|enable>        changes the password for 'pi' user or disables/enables password authentication
sshkey <add|list|delete|deleteall|github> used for adding or removing ssh keys for authentication
version [contributors]                    returns the version of cli.sh command
image                                     returns version of the system image installed
detect [bluetooth|rpi|arm|wifi]           detects the hardware version of any device
ethernet <ip> <mask> <gateway> <dns>      configures rpi network interface to a static ip address
discover <scan|interface|ping|ports|mac>  performs network scan and discovers all raspberry pis on the network
         <rpi> [ipaddress|url|macaddress]
         <wifi>
wifi <ESSID> [password]                   connects to a wifi network
wifihidden <ESSID> [password]             connects to a hidden wifi network
staticwifi <ip> <mask> <gateway> <dns>    configures rpi wifi interface to a static ip address
           <ESSID> [password]
wifistatus                                displays signal strength in dBm and layman nomenclature
bridge <ESSID> <hotspotESSID>             configures the rpi to bridge the wlan interface over a hotspot
       [password] [hotspotPassword]
config [update|add|delete|clear]          commands for interacting with config file
container <none|docker|balena>            enables (and start) the desired container
bluetooth [on|off|pause|restart|button]   switches bluetooth from regular to hotspot mode and shows id or MAC address
          [mac|id|status|log]
ap <local|internet> <ESSID> [password]    creates a mobile ap, which has two modes: local (no eth0 bridging), internet (eth0 bridging)
aphidden <local|internet> <ESSID>         creates a hidden mobile ap with or without internet access
         [password]
apchannel [channel]                       sets or prints the current ap channel
timezone <timezone>                       sets the timezone of the system
locale <locale>                           sets the system locale
ssh [on|off|fingerprint]                  enables or disables the ssh service, also prints out fingerprint of the ssh daemon
vnc [on|off|info]                         enables or disables the vnc server service
default                                   sets a raspbian back to default configuration
wificountry <country>                     sets the wifi country
upgrade [tag|check|bluetooth|force|cli]   upgrades treehouses package using npm
sshtunnel <add|remove|list|check|notice>  helps adding an sshtunnel
          <key|portinterval> [user@host]
led [green|red] [mode]                    sets the led mode
    [dance|thanksgiving|christmas]
    [newyear|lunarnewyear|valentine]
    [carnival|stpatricks|onam]
    [heavymetal|easter|random]
power [mode|current|freq]                 sets the power mode or check power mode/CPU frequency
rtc <on|off> [rasclock|ds3231]            sets up the rtc clock specified
ntp <local|internet>                      sets rpi to host timing locally or to get timing from a remote server
networkmode                               outputs the current network mode
button <off|bluetooth>                    gives the gpio pin 18 an action
feedback <message>                        sends feedback
clone [device path]                       clones the current SDCard onto a secondary SDCard or specified device
restore [device path]                     restores a treehouses image to an SDCard or specified device
burn [device path]                        download and burns the latest treehouses image to the SDcard or specified device
rebootneeded                              shows if reboot is required to apply changes
reboots <now|in|cron>                     reboots at given frequency | removes it if reboot task active
        <daily|weekly|monthly>
internet                                  checks if the rpi has access to internet
services                                  executes the given command on the specified service
   <available|installed [full]>           list available, and installed services
   <ports|running [full]>                 list ports used by services and services running
   [planet]       <install>               Planet Learning is a generic learning system built in Angular & CouchDB
   [kolibri]      <up>                    Kolibri is a learning platform using DJango
   [nextcloud]    <start>                 Nextcloud is a safe home for all your data, files, etc
   [netdata]      <restart>               Netdata is a distributed, real-time performance and health monitoring for systems
   [mastodon]     <stop>                  Mastodon is a free, open-source social network server
   [moodle]       <down>                  Moodle is a learning management system built in PHP
   [pihole]       <cleanup>               Pi-hole is a DNS sinkhole that protects your devices from unwanted content
   [privatebin]   <autorun [true|false]>  PrivateBin is a minimalist, open source online pastebin
   [portainer]    <url [local|tor]>       Portainer is a lightweight management UI for Docker environments
   [ntopng]       <info>                  Ntopng is a network traffic probe that monitors network usage
   [couchdb]      <size>                  CouchDB is an open-source document-oriented NoSQL database, implemented in Erlang
   [mariadb]      <icon>                  MariaDB is a community-developed fork of the MySQL relational database management system
   [mongodb]      <port|ps>               MongoDB is a general purpose, distributed, document-based, NoSQL database
   [seafile]      <config>                Seafile is an open-source, cross-platform file-hosting software system
   [turtleblocksjs]                       TurtleBlocks is an activity with a Logo-inspired graphical "turtle" that draws colorful art
   [musicblocks]                          MusicBlocks is a programming language for exploring musical concepts in an fun way
   [minetest]                             Minetest is an open source infinite-world block sandbox game engine with survival and crafting
   [invoiceninja]                         Invoiceninja is the leading self-host platform to create invoices.
   [librespeed]                           Librespeed is a very lightweight Speedtest implemented in Javascript
tor [list|add|delete|deleteall|start]     deals with services on tor hidden network
    [stop|destroy|notice|status|refresh]
bootoption <console|desktop> [autologin]  sets the boot mode
           <modules|params>
openvpn [use|show|delete]                 helps setting up an openvpn client
        [notice|start|stop|load]
coralenv [install|demo-on|demo-off]       plays with the coral environmental board
         [demo-always-on]
memory [total|used|free]                  displays the total memory of the device, the memory used as well as the available free memory
temperature [celsius|fahrenheit|kelvin]   displays raspberry pi's CPU temperature
speedtest                                 tests internet download and upload speed
camera [on|off|capture]                   enables camera, disables camera, captures png photo
cron [list|add|delete|deleteall]          adds, deletes a custom cron job or deletes, lists all cron jobs
     [0W|tor|timestamp]                   adds premade cron job (or removes it if already active)
usb [on|off]                              turns usb ports on or off
remote [check|status|upgrade|services]    helps with treehouses remote android app
       [version|commands|allservices]
log <0|1|2|3|4|show|max>                  gets/sets log level and shows log
blocker <0|1|2|3|4||max>                  website blocking levels using /etc/hosts
sdbench                                   displays read and write speed of micro SD card
inspire [joke|qotd|random]                displays quote based on user input
convert <input file> <output file>        converts audio and video files
gpio                                      displays raspberry pi model and corresponding GPIO ports
changelog [view|compare]                  displays the most recent changes to treehouses
shutdown [now|in|force]                   shutdown the system
```

## Additional README's
- [Services](https://github.com/treehouses/cli/tree/master/services/README.md)
- [Tests](https://github.com/treehouses/cli/tree/master/tests/README.md)

## Add a new feature
Feel free to make a pull request to our repository.  
Remember the following files
will have to be updated to add a feature:
```
/modules/help.sh       # help text
README.md              # readme
_treehouses            # tabcompletion
/modules/<featurefile> # bash
/tests/<featurefile>   # bash bats tests
```
