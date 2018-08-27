#!/bin/bash

# This script works on Windows 8 or newer since the add-printer cmdlets are't available on Windows 7.

# Check to see if this script is running as admin

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
 {    
  Echo "This script needs to be run As Admin"
  Break
 }

# Variables that changes between different offices
$driver = "Canon iR-ADV C5550/5560 UFR II"
$address = "192.168.0.5"
$name = "Printer name"
$sleep = "3"



Invoke-Command {pnputil.exe -a "driver\CNLB0UA64.inf" }

Start-Sleep $sleep

Add-PrinterDriver -Name $driver

Start-Sleep $sleep

Add-PrinterPort -Name $address -PrinterHostAddress $address

start-sleep $sleep

Add-Printer -DriverName $driver -Name $name -PortName $address

Start-Sleep $sleep 


# This prints a list of installed printers on the local computer. This proves the newly added printer works.

#get-printer |Out-Printer -Name $name 

