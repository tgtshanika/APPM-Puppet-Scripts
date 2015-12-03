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
# Class: idp
#
# This class installs nginx configurations
# Actions:
#   - Install WSO2 AppManager as a nginx
#
# Requires:
#
# Sample Usage:
#


class nginx (

 $maintenance_mode   = true,

  $owner              = 'root',
  $group              = 'root'

) inherits params {

  $deployment_code = 'nginx'
  $conf_files = [
    'store.conf',
    'idp.conf',
    'gateway.conf',
  ]

  file { "/etc/hosts":
      ensure  => present,
      owner   => $nginx::owner,
      group   => $nginx::group,
      mode    => '0755',
      content => template("${nginx::deployment_code}/etc/hosts.erb"),
  }
  nginx::push_conf {
        $conf_files:
          target    => '/etc/nginx/conf.d/',
          directory => $deployment_code
      }

  nginx::start { $deployment_code:
      nginx   => $nginx,
      owner   => $owner,
      target  => $carbon_home,
  }
}

