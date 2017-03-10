#
# Cookbook Name:: deploypowershell
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

powershell_command = "C:\\temp\\Sample.Install.1.0.0\\tools\\install.ps1"
success = system("powershell.exe  #{powershell_command}")
if success then
	print "Successful"
end