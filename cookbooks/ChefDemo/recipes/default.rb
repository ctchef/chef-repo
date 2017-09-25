#
# Cookbook Name:: ChefDemo
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'chef'
require 'fileutils'

def basic_install

	FileUtils.remove_dir("C:\\temp\\ChefDemo.Install.1.0.0")


	#nuget_install_cmd = "\\\\nvinetwin10-msd\\Artifactory\\NuGet\\tools\\nuget.exe install -Source \\\\nvinetwin10-msd\\Artifactory\\ ChefDemo.Install -Version 1.0.0 #-OutputDirectory C:\\temp\\"
	nuget_install_cmd = "\\\\nvinetwin10-msd\\Artifactory\\NuGet\\tools\\nuget.exe install -Source \\\\nvinetwin10-msd\\Artifactory\\ChefDemo.Install.1.0.0 -OutputDirectory C:\\temp\\"
	Chef::Log.info("Executing nuget: #{nuget_install_cmd}")
	exit_code = `#{nuget_install_cmd}`
	Chef::Log.info("Exit code - Nuget : #{exit_code}")

	arr_additional_args = []
	flattened_args = flatten_hash(node["ChefDemo"])
	Chef::Log.info("Additional Chef Arguments to be passed to installer: #{flattened_args}")

	flattened_args.each_pair {|k,v| arr_additional_args.push("#{k}=#{v}") }

	Chef::Log.debug("Chef Arguments array after: #{arr_additional_args}")

	#If the arguments have semi-colons, comma, quote or double quote in them it will break msbuild property string: replace them with appropriate encoded characters - they will be automatically restored in MSbuild.

	arr_additional_args.map!{|v| v.gsub(";","%3B")}
	arr_additional_args.map!{|v| v.gsub(",","%2C")}
	arr_additional_args.map!{|v| v.gsub("'","%27")}
	arr_additional_args.map!{|v| v.gsub('"',"%22")}

	additional_args = arr_additional_args.join(";")

	Chef::Log.info("Additional Chef Arguments to be passed to installer: #{additional_args}")

	powershell_install_cmd = "powershell -ExecutionPolicy ByPass -File C:\\temp\\ChefDemo.Install.1.0.0\\tools\\install.ps1 -Targets Dynamic -AdditionalArgs #{additional_args}"
	Chef::Log.info("Executing installer: \n #{powershell_install_cmd}")
	exit_code = `#{powershell_install_cmd}`
	Chef::Log.info("Exit code - Powershell: #{exit_code}")
end


# flatten a hash, nested hash key are separated with 2 underscores
def flatten_hash(hash, recursive_key = "")
    hash.each_with_object({}) do |(k, v), ret|
      key = recursive_key + k.to_s
      if v.is_a? Hash
        ret.merge! flatten_hash(v, key + "__")
      else
        ret[key] = v
      end
    end
end

basic_install