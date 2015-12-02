# ----------------------------------------------------------------------------
#  Copyright 2005-2015 WSO2, Inc. http://www.wso2.org
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
# Class idp::params
#
# This class manages appm idp parameters
#

class idp::params {

 $local_package_dir    = '/mnt/packs'

  # Database details
  $is_mysql_connector	= true
  $is_mysql_carbon_db   = false
  $is_h2_carbon_db      = true
  $is_mysql_am_db  	= false
  $is_mysql_identity_db  	= true
  $is_h2_identity_db         = false
  $is_h2_idp_reg_db         = false
  $is_mysql_idp_reg_db         = true
  $is_h2_am_db   	= false
  $is_mysql_stat_db	= false
  $is_h2_stat_db	= false
  $is_mysql_um_db = true
  $is_h2_um_db  = false
  $is_mysql_reg_db = false
  $is_h2_reg_db  = false


  # Registry configuration details
  $remote_instance_govregistry = '"https://appm-idp-node1"'
  $remote_instance_configregistry = '"https://mgt.publisher.appm.wso2.com:9643/registry"'
  $remote_instance_gov_cacheid = 'user@jdbc:mysql://192.168.57.144:3306/WSO2_REG_DB'
  $remote_instance_config_cacheid = 'user@jdbc:mysql://192.168.57.144:3306/WSO2_REG_DB'


  #Proxy ports
  $http_proxy_port             = '80'
  $https_proxy_port             = '443'

}
