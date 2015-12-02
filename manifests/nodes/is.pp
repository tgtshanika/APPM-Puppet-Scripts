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

# IDP node 1
node /appm-idp-node1/ inherits base {

    notify { $name:
        message => "on appm-idp-node1 node",
    }

    $docroot = "/mnt/${server_ip}/wso2is-5.0.0"

    class {'idp':

        version            => '5.0.0',
        sub_cluster_domain => 'mgt',
        local_member_host  => 'appm-idp-node1',
        members            => {'appm-idp-node2' => '4000'},
        offset                 => 0,
        hazelcast_port     => '4200',
        thrift_receive_port=> 10505,
        config_db          => 'AS_CONFIG_DB',
        config_target_path => 'AS_CONFIG_PATH',
        maintenance_mode   => 'zero',
        depsync            => false,
        clustering         => true,
        cloud                  => false,
        owner              => 'root',
        group              => 'root',
        target             => "/mnt/${server_ip}"
    }

    require java

    Class['java'] -> Class['idp']
}


#  IDP node 2
node /appm-idp-node2/ inherits base {

    notify { $name:
        message => "on appm-idp-node2 node",
    }

    $docroot = "/mnt/${server_ip}/wso2is-5.0.0"

    class {'idp':

        version            => '5.0.0',
        sub_cluster_domain => 'mgt',
        local_member_host  => 'appm-idp-node2',
        members            => {'appm-idp-node1' => '4200'},
        offset                 => 0,
        hazelcast_port     => '4000',
        thrift_receive_port=> 10505,
        config_db          => 'AS_CONFIG_DB',
        config_target_path => 'AS_CONFIG_PATH',
        maintenance_mode   => 'zero',
        depsync            => false,
        clustering         => true,
        cloud                  => false,
        owner              => 'root',
        group              => 'root',
        target             => "/mnt/${server_ip}"
    }

    require java

    Class['java'] -> Class['idp']
}

