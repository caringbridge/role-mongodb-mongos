#
# Cookbook Name:: role-mongodb-mongos
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum'
include_recipe 'mongodb::mongodb_org_repo'

node.override['mongodb']['package_name'] = 'mongo-10gen-server'
['mongo-10gen', 'mongo-10gen-server'].each do |rpm|
  package rpm do
    version node['mongodb']['package_version']
  end
end

include_recipe 'mongodb::mongos'

service 'mongod' do
  action :disable
end

hostsfile_entry '33.33.33.42' do
  hostname  'shard1'
  action    :create
end

hostsfile_entry '33.33.33.43' do
  hostname  'shard2'
  action    :create
end
