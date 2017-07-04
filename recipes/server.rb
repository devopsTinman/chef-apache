package 'httpd' do
	action :install
end

cookbook_file 'var/www/html/home.html' do
	source 'home.html'
end

remote_file '/var/www/html/robin.png' do
	source 'http://www.technotrainer.com/wp-content/uploads/2016/11/Robin_Beck.png'
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
