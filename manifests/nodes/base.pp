# ----------------------------------------------------------------------------
#  Copyright 2005-2013 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------
#

# base node
node 'base' {

  #essential variables
  $package_repo         = 'PACKAGE_REPO'
  $local_package_dir    = '/mnt/packs'
  $java_distribution	= 'jdk-7u45-linux-x64.tar.gz'
  $java_name		= 'jdk1.7.0_45'
  $java_home		= '/opt/java'
  $server_ip            = $ipaddress

 #Database details

  $jndi_datasource_for_carbon_db= 'jdbc/WSO2CarbonDB'
  $jndi_datasource_for_am_db    = 'jdbc/WSO2AM_DB'
  $jndi_datasource_for_stat_db  = 'jdbc/WSO2AM_STATS_DB'
  $jndi_datasource_for_reg_db  = 'jdbc/WSO2REG_DB'
  $jndi_datasource_for_um_db  = 'jdbc/WSO2UM_DB'
  $jndi_datasource_for_identity_db = 'jdbc/WSO2_IDENTITY_DB'
  $jndi_datasource_for_storage_db = 'jdbc/ES_Storage'

  # MySQL server configuration details
  $mysql_connector_name = 'mysql-connector-java-5.1.35-bin.jar'
  $mysql_server         = '192.168.57.24'
  $mysql_port           = '3306'
  $max_connections      = '100000'
  $max_active           = '50'
  $max_wait             = '60000'
  $mysql_database_name_for_carbon_db    = 'WSO2_CARBON_DB'
  $mysql_username       = 'root'
  $mysql_password       = 'root'
  $mysql_database_name_for_am_db        = 'appm_db'
  $mysql_database_name_for_stat_db      = 'stat_db'
  $mysql_database_name_for_um_db  = 'um_db'
  $mysql_database_name_for_reg_db  = 'reg_db'
  $mysql_database_name_for_identity_db  = 'identity_db'
  $mysql_database_name_for_idp_reg_db  = 'idp_reg_db'
  $mysql_database_name_for_storage_db  = 'storage_db'

  # H2 server configuration details
  $h2_db_path_for_am_db         = 'repository/database'
  $h2_db_path_for_carbon_db     = 'repository/database'
  $h2_db_path_for_stat_db       = 'repository/database'
  $h2_database_name_for_carbon_db       = 'WSO2CARBON_DB'
  $h2_username          = 'wso2carbon'
  $h2_password          = 'wso2carbon'
  $h2_database_name_for_am_db           = 'WSO2AM_DB'
  $h2_database_name_for_stat_db         = 'WSO2AM_STATS_DB'

#Server ports
$store_https_port     = '9443'
$publisher_https_port = '9443'


#hostname mappings
  $puppet_master_node_ip            = '192.168.57.24'
  $puppet_master_node_host_name     = 'puppetmaster'
  $mysql_server_node_ip             = '192.168.57.24'
  $mysql_server_node_host_name      = 'mysql-puppet.appm.wso2.com'
  $publisher_node_ip                = '192.168.57.25'
  $publisher_node_host_name        = 'appm-publisher-node'
  $publisher_host_name        = 'appm-publisher-node'
  $store_node1_ip                   = '192.168.57.26'
  $store_node1_host_name     = 'appm-store-node1'
  $store_node2_ip                = '192.168.57.27'
  $store_node2_host_name         = 'appm-store-node2'
  $store_cluster_ip                = '192.168.57.27'
  $store_cluster_host_name         = 'store.appm.wso2.com'
  $idp_node1_ip                      = '192.168.57.31'
  $idp_node1_host_name               = 'appm-idp-node1'
  $idp_node2_ip                      = '192.168.57.246'
  $idp_node2_host_name               = 'appm-idp-node2'
  $idp_cluster_ip                = '192.168.57.27'
  $idp_cluster_host_name         = 'idp.appm.wso2.com'
  $gateway_node1_ip              = '192.168.57.29'
  $gateway_node1_host_name       = 'appm-gateway-node1'
  $gateway_node2_ip           = '192.168.57.30'
  $gateway_node2_host_name    = 'appm-gateway-node2'
  $gw_cluster_host_name         = 'gw.appm.wso2.com'
  $gw_cluster_ip                = '192.168.57.27'

  #Clustering details
  $idp_cluster_domain    = 'wso2.appm.idp.domain'  
  $gateway_domain       = 'wso2.appm.gw.domain'
  $publisher_domain      = 'wso2.pub.store.domain'
  $membership_scheme     = 'wka'  
  #Proxy ports
  $http_proxy_port             = '80'
  $https_proxy_port             = '443'

  #LDAP settings - not used
  $ldap_connection_uri      = 'ldap://localhost:10389'
  $bind_dn                  = 'uid=admin,ou=system'
  $bind_dn_password         = 'adminpassword'
  $user_search_base         = 'ou=system'
  $group_search_base        = 'ou=system'
  $sharedgroup_search_base  = 'ou=SharedGroups,dc=wso2,dc=org'

# app-manager.xml => <AuthManager>
  $auth_manager_server_url    =  $idp_cluster_host_name
  $auth_manager_server_port   = '9443'
  $auth_manager_username      = 'admin'
  $auth_manager_password      = 'admin'

  # app-manager.xml => <APIGateway>
  $app_gateway_server_url     = $gw_cluster_host_name
  $app_gateway_server_port    = '9443'
  $app_gateway_http_endpoint  = $gw_cluster_host_name
  $app_gateway_http_port      = '8280'
  $app_gateway_https_endpoint = $gw_cluster_host_name
  $app_gateway_https_port     = '8243'

  # app-manager.xml => <SSOConfiguration>
  $sso_identity_provider_url      = $idp_cluster_host_name
  $sso_identity_provider_port     = '9443'
  $sso_identity_provider_username = 'admin'
  $sso_identity_provider_password = 'admin'
  $sso_identity_provider_name     = 'wso2is'
  $sso_identity_provider_version  = '5.0.0'

  $thirif_server_host         = '192.168.57.132'
  $enable_thrift_server       = false


require appm_base 
}
