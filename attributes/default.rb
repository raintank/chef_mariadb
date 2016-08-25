# database related
default[:chef_mariadb][:create_database] = true
default[:chef_mariadb][:create_replication_user] = false
default[:chef_mariadb]['worldping-api'][:db_name] = "worldping-api"
default[:chef_mariadb]['worldping-api'][:db_user] = "grafana"
default[:chef_mariadb]['worldping-api'][:db_password] = "grafpass"
default[:chef_mariadb][:task_server][:db_name] = "task_server"
default[:chef_mariadb][:task_server][:db_user] = "grafana"
default[:chef_mariadb][:task_server][:db_password] = "grafpass"
default[:chef_mariadb][:mysql_disk] = "/dev/sdb"
# filesystem options
default[:chef_mariadb][:fs][:fs_type] = "ext4"
default[:chef_mariadb][:fs][:fs_opts] = "noatime,nodiratime"
default[:mariadb][:galera][:cluster_name] = "galera_raintank"
default[:grafana][:db_name] = "grafana"
default[:grafana][:db_user] = "grafana"
default[:grafana][:db_password] = "grafpass"
default[:grafana][:db_port] = 3306
default[:mariadb][:galera][:wsrep_cluster_address] = "gcomm://"
default[:mariadb][:innodb][:options][:innodb_flush_log_at_trx_commit] = 0
default[:mariadb][:replication][:expire_logs_days] = 2
override['mariadb']['galera']['cluster_search_query'] = "tags:mariadb AND chef_environment:#{node.environment} AND mariadb_galera_cluster_name:#{node['mariadb']['galera']['cluster_name']}"
override[:mariadb][:use_default_repository] = true
override[:mariadb][:mysqld][:options][:binlog_format] = "ROW"
override[:mariadb][:innodb][:options][:innodb_autoinc_lock_mode] = 2
override[:mariadb][:galera][:wsrep_sst_method] = 'xtrabackup-v2'
override[:mariadb][:replication][:log_bin] = "binlog"
override[:mariadb][:replication][:log_bin_index] = "# leave log_bin_index undefined"
