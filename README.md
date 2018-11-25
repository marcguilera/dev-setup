# Dev setup

Small script to help setup everything I need to get a computer up un running for development (`android-sdk`, `dart`, `IntelliJ`, `npm`, etc.)

Simply run the `./run.sh` script and follow the instructions on the screen.

There are a couple of predefined setups:

* Frontend
* Backend
* Mobile
* Extras

Currently it only works for Mac since it relies on `brew`.

# Example

```bash

Dev Setup

[1] basic
[2] frontend
[3] backend
[4] all
[5] mobile
[6] extras
[7] web
Choose an option to install: 4
You chose to install all. Let's go!

'npm' is already installed, skipping...
'java' is already installed, skipping...
'kotlin' is already installed, skipping...
'ant' is already installed, skipping...
'maven' is already installed, skipping...
'gradle' is already installed, skipping...
'intellij-idea' is already installed, skipping...
 > Do you want to install 'android-sdk'? yes
Installing 'android-sdk'...
Done installing 'android-sdk'
'ios-deploy' is already installed, skipping...
'cocoapods' is already installed, skipping...
'angular_cli' is already installed, skipping...
'git' is already installed, skipping...
'docker-toolbox' is already installed, skipping...
'stagehand' is already installed, skipping...
'yo' is already installed, skipping...
'atom' is already installed, skipping...

Installed 1 packages: [android-sdk]
Skipped 0 packages: []
Done! Elapsed: 0:00:12.730341

Add this to your bash_profile file:
----------------------------------------------
export ANDROID_HOME=/usr/local/bin/android
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH/:\$ANDROID_HOME/platform-tools
----------------------------------------------

```
