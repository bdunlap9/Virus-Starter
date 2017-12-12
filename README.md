# Virus-Starter
Batch Virus template

Requires to be run as Administrator

# Functions
Disables Recovery Options in windows
  1. Disable Startup Repair from trying to start when a problem is detected
  2. Disable Windows recovery at startup

Adds to startup via multiple methods:
  1. Copy's itself into the autoexec.bat 
  2. HAT method (Hooking Autoexec.bat)
  3. Registry
  4. System.ini
  5. Win.ini
  6. Startup folder
  7. Shell Spawning

You can keep all startup methods or you can delete the methods you dont want to use by deleteing the lines under ::<method>

# Virus
Where you start to write your malware code is under the :infect
