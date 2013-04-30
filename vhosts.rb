require 'erb'
require 'json'
require 'fileutils'

file = open("domains.json")
json = file.read

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

