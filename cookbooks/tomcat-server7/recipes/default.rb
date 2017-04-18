#
# Cookbook Name:: tomcat-server7
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#sudo yum install tomcat

package 'tomcat'


#restart the Tomcat service
service 'tomcat' do
	action [:nothing,:enable]
end

#Let's make a quick change to the Java options that Tomcat uses when it starts. 
#Open the Tomcat configuration file:
#sudo vi /usr/share/tomcat/conf/tomcat.conf

template '/usr/share/tomcat/conf/tomcat.conf' do
	source 'tomcat.conf.erb'
	owner 'tomcat'
	group 'tomcat'
	mode 0644
	notifies :restart, 'service[tomcat]'	, :immediately
end

template '/usr/share/tomcat/conf/tomcat-users.xml' do
	source 'tomcat-users.xml.erb'
	owner 'tomcat'
	group 'tomcat'
	mode 0644
	notifies :restart, 'service[tomcat]'	, :immediately
end

package 'tomcat-webapps'
package 'tomcat-admin-webapps'

