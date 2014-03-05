require 'erb'
require 'json'
require 'fileutils'

file = open("domains.json")
json = file.read

_DBUSER = 'fueldev'
_DBPASS = 'fueldev'

parsed = JSON.parse(json)

domain_template = ERB.new(File.read('template.conf.erb'))

parsed["domains"].each do |domain|
  full_domain = domain["full_domain"]
  folder_name = domain["folder_name"]
  File.open("./files/httpd/vhosts/#{domain['full_domain']}.conf", "w") do |f|
    f.write(domain_template.result(binding))
  end
  FileUtils.mkdir "./clients/#{folder_name}" unless File.directory?("./clients/#{folder_name}")
end

File.open("domains_hosts_file.txt", "w") do |f|
  parsed["domains"].each do |domain|
    f.write("192.168.56.60  " + domain["full_domain"] + "\n")
  end
end

File.open("./files/mysql/create_dbs.sh", "w") do |f|
  parsed["domains"].each do |domain|
    unless domain["database"].nil?
        f.write("/usr/bin/mysql -uroot -proot -e \"create database " + domain["database"] + "; grant all on " + domain["database"] + ".* to " + _DBUSER + "@localhost identified by '" + _DBPASS + "';\"" + "\n")
    end
  end
end

