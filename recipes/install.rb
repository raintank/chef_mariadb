#
# Cookbook Name:: chef_mariadb
# Recipe:: install
#
# Copyright (C) 2016 Raintank, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt"

apt_repository "percona" do
  uri "https://repo.percona.com/apt"
  distribution node["lsb"]["codename"]
  components [ 'main' ]
  key '1C4CBDCDCD2EFD2A'
  keyserver 'keyserver.ubuntu.com'
  #keyserver 'keys.gnupg.net'
  action :add
  deb_src true
end

node.hostname =~ /(\d+?)/
s_id = $1 || 1
node.override[:mariadb][:replication][:server_id] = s_id.to_s
node.set[:mariadb][:mysqld][:options][:log_slave_updates] = 1

include_recipe "mariadb::galera"

# and create the grafana database if it doesn't exist. Installing grafana will
# not, by itself, create it.
package "build-essential"

mysql2_chef_gem 'default' do
  provider Chef::Provider::Mysql2ChefGem::Mariadb
  action :install
end

connection_info = { :host => "127.0.0.1",
  :port => node['grafana']['db_port'],
  :username => 'root',
  :password => node['mariadb']['server_root_password']
}

if node[:chef_mariadb][:create_database]
  mysql_database node['grafana']['db_name'] do
    connection connection_info
    action :create
  end

  mysql_database node['chef_mariadb']['worldping-api']['db_name'] do
    connection connection_info
    action :create
  end

  mysql_database node['chef_mariadb']['task_server']['db_name'] do
    connection connection_info
    action :create
  end

  if !node['chef_mariadb']['sst_user'].nil?
    mysql_database_user node['chef_mariadb']['sst_user'] do
      connection connection_info
      password node['chef_mariadb']['sst_password']
      action :create
    end
    mysql_database_user node['chef_mariadb']['sst_user'] do
      connection connection_info
      password node['chef_mariadb']['sst_password']
      privileges [ :reload, :"lock tables", :"replication client" ]
      action :grant
    end
  end
  if node['grafana']['db_user'] != 'root'
    mysql_database_user node['grafana']['db_user'] do
      connection connection_info
      password node['grafana']['db_password']
      action :create
    end
    mysql_database_user node['grafana']['db_user'] do
      connection connection_info
      password node['grafana']['db_password']
      database_name node['grafana']['db_name']
      host node['chef_mariadb']['repl_host'] || "localhost"
      privileges [:all]
      action :grant
    end
  end
  if !node['chef_mariadb']['repl_user'].nil?
    mysql_database_user node['chef_mariadb']['repl_user'] do
      connection connection_info
      password node['chef_mariadb']['repl_pass']
      action :create
    end
    mysql_database_user node['chef_mariadb']['repl_user'] do
      connection connection_info
      password node['chef_mariadb']['repl_pass']
      privileges [ :"replication slave" ]
      host node['chef_mariadb']['repl_host']
      action :grant
    end
  end
  if node['chef_mariadb']['worldping-api']['db_user'] != 'root'
    mysql_database_user node['chef_mariadb']['worldping-api']['db_user'] do
      connection connection_info
      password node['chef_mariadb']['worldping-api']['db_password']
      action :create
    end
    mysql_database_user node['chef_mariadb']['worldping-api']['db_user'] do
      connection connection_info
      password node['chef_mariadb']['worldping-api']['db_password']
      database_name node['chef_mariadb']['worldping-api']['db_name']
      host node['chef_mariadb']['repl_host'] || "localhost"
      privileges [:all]
      action :grant
    end
  end
  if node['chef_mariadb']['task_server']['db_user'] != 'root'
    mysql_database_user node['chef_mariadb']['task_server']['db_user'] do
      connection connection_info
      password node['chef_mariadb']['task_server']['db_password']
      action :create
    end
    mysql_database_user node['chef_mariadb']['task_server']['db_user'] do
      connection connection_info
      password node['chef_mariadb']['task_server']['db_password']
      database_name node['chef_mariadb']['task_server']['db_name']
      host node['chef_mariadb']['repl_host']
      privileges [:all]
      action :grant
    end
  end
end

tag("mariadb")
