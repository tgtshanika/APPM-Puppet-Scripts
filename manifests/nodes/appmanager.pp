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

# publisher mode
node /appm-publisher-node/ inherits base {

    notify { $name: 
        message => "on appm-publisher-node node",
    }

    $docroot = "/mnt/${server_ip}/wso2appm-1.0.0"

    class {'publisher':

        version            => '1.0.0',
        members            => {'appm-store-node1' => '4100'},
        offset             => 0,
        sub_cluster_domain => 'worker',
        local_member_host  => 'appm-publisher-node',
        hazelcast_port     => 4000,
        maintenance_mode   => 'zero',
        thrift_receive_port=> 10501,
        clustering         => true,
        owner              => 'root',
        group              => 'root',
        target             => "/mnt/${server_ip}"
    }
  
    require java  

    Class['java'] -> Class['publisher']
}

#store node 1
node /appm-store-node1/ inherits base {

    notify { $name: 
        message => "on appm-store-node1 node",
    }

    $docroot = "/mnt/${server_ip}/wso2appm-1.0.0"

    class {'store':

        version            => '1.0.0',
        sub_cluster_domain => 'worker',
        members            => {'appm-publisher-node' => '4000', 'appm-store-node2' => '4200'},
        local_member_host  => 'appm-store-node1',
        offset             => 0,
        maintenance_mode   => 'zero',
        hazelcast_port     => 4100,
        thrift_receive_port=> 10507,
        depsync            => false,
        clustering         => true,
        nginx              => false,
        owner              => 'root',
        group              => 'root',
        target             => "/mnt/${server_ip}"
    }
  
    require java  

    Class['java'] -> Class['store']
}

#store worker node and nginx node
node /appm-store-node2/ inherits base {

    notify { $name: 
        message => "on appm-store-node2 node",
    }

    $docroot = "/mnt/${server_ip}/wso2appm-1.0.0"

    class {'store':

        version            => '1.0.0',
        sub_cluster_domain => 'worker',
        members            => {'appm-store-node1' => '4100'},
        local_member_host  => 'appm-store-node2',
        offset             => 1,
        maintenance_mode   => 'zero',
        hazelcast_port     => 4200,
        thrift_receive_port=> 10502,
        depsync            => false,
        clustering         => true,
        nginx              => true,
        owner              => 'root',
        group              => 'root',
        target             => "/mnt/${server_ip}"
    }
  
    require java  

    Class['java'] -> Class['store']
}

# gateway managment node
node /appm-gateway-node1/ inherits base {

    notify { $name: 
        message => "on appm-gateway-node1 node",
    }

    $docroot = "/mnt/${server_ip}/wso2appm-1.0.0"

    class {'gateway':

        version            => '1.0.0',
        sub_cluster_domain => 'mgt',
        members            => {'appm-gateway-node2' => '4200'},
        local_member_host  => 'appm-gateway-node1',
        offset             => 0,
        hazelcast_port     => 4100,
        thrift_receive_port=> 10503,
        maintenance_mode   => 'zero',
        depsync            => false,
        clustering         => true,
        owner              => 'root',
        group              => 'root',
        target             => "/mnt/${server_ip}"
    }
  
    require java  

    Class['java'] -> Class['gateway']
}

# gateway worker node
node /appm-gateway-node2/ inherits base {

    notify { $name: 
        message => "on appm-gateway-node2 node",
    }

    $docroot = "/mnt/${server_ip}/wso2appm-1.0.0"

    class {'gateway':

        version            => '1.0.0',
        sub_cluster_domain => 'worker',
        members            => {'appm-gateway-node1' => '4100'},
        local_member_host  => 'appm-gateway-node2',
        offset             => 0,
        hazelcast_port     => 4200,
        thrift_receive_port=> 10504,
        maintenance_mode   => 'zero',
        depsync            => true,
        clustering         => true,
        owner              => 'root',
        group              => 'root',
        target             => "/mnt/${server_ip}"
    }
  
    require java  

    Class['java'] -> Class['gateway']
}
