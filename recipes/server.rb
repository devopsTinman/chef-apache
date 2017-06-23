package 'httpd' do
	action :install
end

file '/var/www/html/index.html' do
	content "<html><head>Hello World</head><body>Hello World! <br>IPAddress: #{node['ipaddress']}<br>Hostname: #{node['hostname']}</body></html>"
	action :create
	owner 'root'
	mode '0655'
	group 'root'
end

service 'httpd' do
	action [ :enable, :start ]
end
