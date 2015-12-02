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
# Class gateway::params
#
# This class manages appm gateway parameters
#

class gateway::params {

  $local_package_dir    = '/mnt/packs'
  $host_name            = $local_member_host
  $mgt_host_name        = $local_member_host
  $depsync_enable       = true
  $auto_commit          = true
  $auto_checkout        = true
  $svn_url              = 'http://192.168.57.24/svn/repo/'
  $svn_username         = 'svnUser'
  $svn_password         = 'svnUser'
  $svn_kit_file_name    = 'svnkit-1.3.9.wso2v2.jar'
  $trilead_ssh_file_name= 'trilead-ssh2-1.0.0-build215.jar'

 $is_appm_usage_tracker        = false


  $membership_scheme  = 'wka'


  # Database details
  $is_mysql_connector	= true
  $is_mysql_carbon_db   = false
  $is_h2_carbon_db      = true
  $is_mysql_am_db  	= true
  $is_h2_am_db   	= false
  $is_mysql_stat_db	= false
  $is_h2_stat_db	= false
  $is_mysql_um_db = true
  $is_h2_um_db  = false
  $is_mysql_reg_db = true
  $is_h2_reg_db  = false

  #Proxy ports
  $http_proxy_port             = '80'
  $https_proxy_port             = '443'

}
