package 'httpd' do
	action :install
end

cookbook_file 'var/www/html/home.html' do
	source 'home.html'
end

template '/var/www/html/index.html' do
	source 'index.html.erb'
	action :create
	owner 'root'
	mode '0655'
	group 'root'
end


service 'httpd' do
	action [ :enable, :start ]
end
