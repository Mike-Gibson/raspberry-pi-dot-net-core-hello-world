# Raspberry Pi Hello World

### Overview

.NET Core 3.1 Console app running on the Raspberry Pi (4) with remote debugging.

### Set Up

#### Pi

1. Install Raspbian on the Pi SD card (lite is fine)

2. Enable SSH service using `sudo raspi-config`

3. Install .NET Core dependencies (https://github.com/dotnet/core/blob/master/samples/RaspberryPiInstructions.md#linux):

    ```bash
    sudo apt-get update
    sudo apt-get install curl libunwind8 gettext apt-transport-https
    ```

4. Configure remote debugging (https://www.hanselman.com/blog/RemoteDebuggingWithVSCodeOnWindowsToARaspberryPiUsingNETCoreOnARM.aspx)

    1. Install the VS remote debugger on your Pi by running this command:
    `curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l ~/vsdbg`
    2. ​To debug you will need to run the program as root, so we'll need to be able to remote launch the program as root as well. For this, we need to first set a password for the root user in your pi, which you can do by running:
    `sudo passwd root`
    3. Then we need to enable ssh connections using root, by running:
    `sudo nano /etc/ssh/sshd_config`
    and adding a line that reads:
    `PermitRootLogin yes`
    reboot the pi: `sudo reboot`

#### On Mac

1. Configure SSH login to the pi

    1. Generate a new SSH key with `ssh-keygen -t rsa -f ~/.ssh/pi_rsa`

    2. Add to authorized hosts on the Pi with `ssh-copy-id -i /~/.ssh/pi_rsa.pub pi@raspberrypi.local`

    3. In `~/.ssh/config` add

    ```
    Host pi
        HostName     raspberrypi.local
        User         pi
        IdentityFile ~/.ssh/pi_rsa
    ```

### Running

In VS Code, run the `.NET Core Launch (remote console)` launch profile