package 'httpd' do
	action :install
end

file '/var/www/html/index.html' do
	content '<html><head>Hello World</head><body>Hello World</body></html>'
	action :create
	owner 'root'
	mode '0655'
	group 'root'
end

service 'httpd' do
	action [ :enable, :start ]
end
