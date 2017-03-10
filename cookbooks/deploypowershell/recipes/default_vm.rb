#
# Cookbook Name:: deploypowershell
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

powershell_command = "echo (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name"
#powershell_command = "\\\\nvinetwin10-msd\\Artifactory\\deploy.ps1"
success = system("powershell.exe -ExecutionPolicy ByPass -File #{powershell_command}")
if success then
	print "Successful"
else 
	print "UnSuccessful"
end