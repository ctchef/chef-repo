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

require 'fileutils'


nugetexe_src= "\\\\nvinetwin10-msd\\Artifactory\\NuGet\\tools\\nuget.exe"
nugetexe_dst= "C:\\temp\\"

nuspec_src = "\\\\nvinetwin10-msd\\Artifactory\\Sample.Install.1.0.0.nupkg"
nuspec_dst = "C:\\temp\\"

def copy(s,d) 
 FileUtils.cp(s,d)
end

copy(nugetexe_src, nugetexe_dst)
copy(nuspec_src, nuspec_dst)

nuget_install_cmd = "C:\\temp\\nuget.exe install -Source C:\\temp\\ Sample.Install -Version 1.0.0 -OutputDirectory C:\\temp\\"
exit_code = `#{nuget_install_cmd}`