package 'httpd' do
	action :install
end

file '/var/www/index.html' do
	action :create
	owner 'root'
	mode '0655'
	group 'root'
end

service 'httpd' do
	action :start
end
