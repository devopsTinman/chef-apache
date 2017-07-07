package 'httpd' do
	action :install
end

template '/var/www/html/index.html' do
	source 'index.html.erb'
	action :create
	owner 'root'
	mode '0655'
	group 'root'
end

bash "inline script" do
	user "root"
	code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites"
#	not_if '[ -d /var/www/mysites/ ]'
	not_if do
		File.directory?('/var/www/mysites')
	end
end

execute "run a script" do
	user "root"
	command <<-EOH
	mkdir -p /var/www/mysites/ /
	chown -R apache /var/www/mysites/
	EOH
	not_if
end

execute "run script" do
	user "root"
	command './myscript.sh'
	not_if
end

directory "/var/www/mysites" do
	owner 'apache'
	recursive true
end

service 'httpd' do
	action [ :enable, :start ]
end
