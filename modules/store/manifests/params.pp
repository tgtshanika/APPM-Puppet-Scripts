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
# Class store::params
#
# This class manages appm store parameters
#

class store::params {

  $local_package_dir    = '/mnt/packs'
  $mgt_host_name        = 'store.appm.wso2.com'

  # Clustering - axis2.xml
  $publisher_domain     = 'wso2.pub.store.domain'
  $depsync_enable = false
   $store_https_port = '9443'

  # Database details
  $is_mysql_connector	= true
  $is_mysql_carbon_db   = false
  $is_h2_carbon_db      = true
  $is_mysql_am_db  	= true
  $is_h2_am_db   	= false
  $is_mysql_stat_db	= false
  $is_h2_stat_db	= true
  $is_mysql_um_db = true
  $is_h2_um_db  = false
  $is_mysql_reg_db = true
  $is_h2_reg_db  = false
  $is_h2_storage_db = false
  $is_mysql_storage_db = true


  # Registry configuration details
  $remote_instance_govregistry = '"https://store.appm.wso2.com"'
  $remote_instance_gov_cacheid = 'root@jdbc:mysql://192.168.57.24:3306/reg_db'

  # AppM statictics configration details
  $is_ui_activity_bam_publish	= false
  $is_appm_usage_tracker	= false
  $bam_thrift_port		= '7611'
  $bam_server_url		= 'tcp://10.10.10.6:7611/'
  $bam_username			= 'admin'
  $bam_password			= 'admin'

  #Proxy ports
  $http_proxy_port             = '80'
  $https_proxy_port             = '443'

  #nginx conf
  $nginx_crt_name     = 'server'
  $nginx_key_name     = 'server'

}
