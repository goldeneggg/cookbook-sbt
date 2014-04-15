#
# Cookbook Name:: sbt
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script "install_sbt" do
    interpreter "bash"
    user "root"
    cwd "#{node['sbt']['dir']}"
    code <<-EOH
        wget http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/#{node['sbt']['version']}/#{node['sbt']['jar_name']}
    EOH
    not_if "ls #{node['sbt']['dir']}/#{node['sbt']['jar_name']}"
end

template "#{node['sbt']['dir']}/#{node['sbt']['bin_name']}" do
    mode 0755
    source "sbt.erb"
    action :create
end
