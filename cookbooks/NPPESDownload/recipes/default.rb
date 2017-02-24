#
# Cookbook Name:: NPPESDownload
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
require 'fileutils'

dest = "#{node['NPPESDownload']['TargetDirectory']}"
source = "//NVINETWIN10-MSD/Artifactory"

fileutils.cp(source, dest)