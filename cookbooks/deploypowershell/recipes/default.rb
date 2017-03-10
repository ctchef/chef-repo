#
# Cookbook Name:: deploypowershell
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#powershell_script "run power shell script" do
#  code "////NVINETWIN10-MSD/Artifactory/deploy.ps1"
#end

require 'chef'
require 'fileutils'

FileUtils.remove_dir("C:\\temp\\Sample.Install.1.0.0")
nuget_install_cmd = "\\\\nvinetwin10-msd\\Artifactory\\NuGet\\tools\\nuget.exe install -Source \\\\nvinetwin10-msd\\Artifactory\\ Sample.Install -Version 1.0.0 -OutputDirectory C:\\temp\\"
Chef::Log.info("Executing nuget: #{nuget_install_cmd}")
exit_code = `#{nuget_install_cmd}`
Chef::Log.info("Exit code - Nuget : #{exit_code}")

powershell_install_cmd = "powershell -ExecutionPolicy ByPass -File C:\\temp\\Sample.Install.1.0.0\\tools\\install.ps1"
Chef::Log.info("Executing installer: \n #{powershell_install_cmd}")
exit_code = `#{powershell_install_cmd}`
Chef::Log.info("Exit code - Powershell: #{exit_code}")