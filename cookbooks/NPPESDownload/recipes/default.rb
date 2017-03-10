#
# Cookbook Name:: NPPESDownload
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
require 'fileutils'

src= "\\\\nvinetwin10-msd\\Artifactory\\PY27_NPPES_Monthly_File_Download_Local.py"
dst= "#{node['NPPESDownload']['TargetDirectory']}"

def copy(s,d) 
 FileUtils.cp(s,d)
end

copy(src, dst)
