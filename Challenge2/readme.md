get_ec2_metadata.py -<br> 1. gets the metadata of the current ec2 instance in json format.
                      2. Asks for input of a key whose metadata data value is needed and returns the value as output. <br>

TEST RESULTS :<br>
{
    "meta-data": {
        "ami-id": "ami-08c40ec9ead489470",
        "ami-launch-index": 0,
        "ami-manifest-path": "(unknown)",
        "block-device-mapping": {
            "ami": "/dev/sda1",
            "ephemeral0": "sdb",
            "ephemeral1": "sdc",
            "root": "/dev/sda1"
        },
        "events": {
            "maintenance": {
                "history": [],
                "scheduled": []
            }
        },
        "hostname": "ip-172-31-27-135.ec2.internal",
        "identity-credentials": {
            "ec2": {
                "info": {
                    "AccountId": "616622369747",
                    "Code": "Success",
                    "LastUpdated": "2022-12-05T15:51:21Z"
                },
                "security-credentials": {
                    "ec2-instance": {
                        "AccessKeyId": "",
                        "Code": "Success",
                        "Expiration": "2022-12-05T21:50:56Z",
                        "LastUpdated": "2022-12-05T15:49:35Z",
                        "SecretAccessKey": "",
                        "Token": "",
                        "Type": "AWS-HMAC"
                    }
                }
            }
        },
        "instance-action": "none",
        "instance-id": "i-0ea7f4342eb70f6e6",
        "instance-life-cycle": "on-demand",
        "instance-type": "t2.micro",
        "local-hostname": "ip-172-31-27-135.ec2.internal",
        "local-ipv4": "172.31.27.135",
        "mac": "0a:7f:a4:f5:69:5b",
        "metrics": {
            "vhostmd": "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        },
        "network": {
            "interfaces": {
                "macs": {
                    "0a:7f:a4:f5:69:5b": {
                        "device-number": 0,
                        "interface-id": "eni-0f6601c0251a0bd4c",
                        "ipv4-associations": {
                            "18.234.133.209": "172.31.27.135"
                        },
                        "local-hostname": "ip-172-31-27-135.ec2.internal",
                        "local-ipv4s": "172.31.27.135",
                        "mac": "0a:7f:a4:f5:69:5b",
                        "owner-id": 616622369747,
                        "public-hostname": "ec2-18-234-133-209.compute-1.amazonaws.com",
                        "public-ipv4s": "18.234.133.209",
                        "security-group-ids": "sg-01c34e8a4063c11b3",
                        "security-groups": "launch-wizard-2",
                        "subnet-id": "subnet-04408e1f235f09046",
                        "subnet-ipv4-cidr-block": "172.31.16.0/20",
                        "vpc-id": "vpc-0f2ef5d2d9ef7bc47",
                        "vpc-ipv4-cidr-block": "172.31.0.0/16",
                        "vpc-ipv4-cidr-blocks": "172.31.0.0/16"
                    }
                }
            }
        },
        "placement": {
            "availability-zone": "us-east-1d",
            "availability-zone-id": "use1-az4",
            "region": "us-east-1"
        },
        "profile": "default-hvm",
        "public-hostname": "ec2-18-234-133-209.compute-1.amazonaws.com",
        "public-ipv4": "18.234.133.209",
        "public-keys": {
            ""
        },
        "reservation-id": "r-0986b1770c18820c5",
        "security-groups": "launch-wizard-2",
        "services": {
            "domain": "amazonaws.com",
            "partition": "aws"
        },
        "system": "xen"
    }
}

Enter the key:ami-id <br>
value is -------------------------------------------------------------- <br>
"ami-08c40ec9ead489470"





------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

get_ec2_metadata.yaml - ansible playbook that gathers and returns ec2 metadata facts of any ec2 instance listed in inventory.
Can also query the value of a key in the metadata response. <br>

TEST RESULTS: <br>

PLAY [localhost] ********************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
^[[Aok: [localhost]

TASK [ec2_metadata_facts] ***********************************************************************************************************************************
ok: [localhost]

TASK [set var] **********************************************************************************************************************************************
ok: [localhost]

TASK [print] ************************************************************************************************************************************************
ok: [localhost] => {
    "msg": {
        "ansible_ec2_ami_id": "ami-08c40ec9ead489470",
        "ansible_ec2_ami_launch_index": "0",
        "ansible_ec2_ami_manifest_path": "(unknown)",
        "ansible_ec2_block_device_mapping_ami": "/dev/sda1",
        "ansible_ec2_block_device_mapping_ephemeral0": "sdb",
        "ansible_ec2_block_device_mapping_ephemeral1": "sdc",
        "ansible_ec2_block_device_mapping_root": "/dev/sda1",
        "ansible_ec2_events_maintenance_history": "[]",
        "ansible_ec2_events_maintenance_scheduled": "[]",
        "ansible_ec2_hostname": "ip-172-31-27-135.ec2.internal",
        "ansible_ec2_identity_credentials_ec2_info": "{\n  \"Code\" : \"Success\",\n  \"LastUpdated\" : \"2022-12-02T14:59:51Z\",\n  \"AccountId\" : \"616622369747\"\n}",
        "ansible_ec2_identity_credentials_ec2_info_accountid": "616622369747",
        "ansible_ec2_identity_credentials_ec2_info_code": "Success",
        "ansible_ec2_identity_credentials_ec2_info_lastupdated": "2022-12-02T14:59:51Z",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance": "",\n  \"Expiration\" : \"2022-12-02T21:16:17Z\"\n}",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance_accesskeyid": "",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance_code": "Success",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance_expiration": "2022-12-02T21:16:17Z",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance_lastupdated": "2022-12-02T15:00:17Z",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance_secretaccesskey": "",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance_token": "",
        "ansible_ec2_identity_credentials_ec2_security_credentials_ec2_instance_type": "AWS-HMAC",
        "ansible_ec2_instance_action": "none",
        "ansible_ec2_instance_id": "i-0ea7f4342eb70f6e6",
        "ansible_ec2_instance_identity_document": "{\n  \"accountId\" : \"616622369747\",\n  \"architecture\" : \"x86_64\",\n  \"availabilityZone\" : \"us-east-1d\",\n  \"billingProducts\" : null,\n  \"devpayProductCodes\" : null,\n  \"marketplaceProductCodes\" : null,\n  \"imageId\" : \"ami-08c40ec9ead489470\",\n  \"instanceId\" : \"i-0ea7f4342eb70f6e6\",\n  \"instanceType\" : \"t2.micro\",\n  \"kernelId\" : null,\n  \"pendingTime\" : \"2022-12-02T08:12:53Z\",\n  \"privateIp\" : \"172.31.27.135\",\n  \"ramdiskId\" : null,\n  \"region\" : \"us-east-1\",\n  \"version\" : \"2017-09-30\"\n}",
        "ansible_ec2_instance_identity_document_accountid": "616622369747",
        "ansible_ec2_instance_identity_document_architecture": "x86_64",
        "ansible_ec2_instance_identity_document_availabilityzone": "us-east-1d",
        "ansible_ec2_instance_identity_document_billingproducts": null,
        "ansible_ec2_instance_identity_document_devpayproductcodes": null,
        "ansible_ec2_instance_identity_document_imageid": "ami-08c40ec9ead489470",
        "ansible_ec2_instance_identity_document_instanceid": "i-0ea7f4342eb70f6e6",
        "ansible_ec2_instance_identity_document_instancetype": "t2.micro",
        "ansible_ec2_instance_identity_document_kernelid": null,
        "ansible_ec2_instance_identity_document_marketplaceproductcodes": null,
        "ansible_ec2_instance_identity_document_pendingtime": "2022-12-02T08:12:53Z",
        "ansible_ec2_instance_identity_document_privateip": "172.31.27.135",
        "ansible_ec2_instance_identity_document_ramdiskid": null,
        "ansible_ec2_instance_identity_document_region": "us-east-1",
        "ansible_ec2_instance_identity_document_version": "2017-09-30",
        "ansible_ec2_instance_identity_pkcs7": "",
        "ansible_ec2_instance_life_cycle": "on-demand",
        "ansible_ec2_instance_type": "t2.micro",
        "ansible_ec2_local_hostname": "ip-172-31-27-135.ec2.internal",
        "ansible_ec2_local_ipv4": "172.31.27.135",
        "ansible_ec2_mac": "0a:7f:a4:f5:69:5b",
        "ansible_ec2_metrics_vhostmd": "<?xml version=\"1.0\" encoding=\"UTF-8\"?>",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_device_number": "0",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_interface_id": "eni-0f6601c0251a0bd4c",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_ipv4_associations_18.234.133.209": "172.31.27.135",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_local_hostname": "ip-172-31-27-135.ec2.internal",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_local_ipv4s": "172.31.27.135",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_mac": "0a:7f:a4:f5:69:5b",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_owner_id": "616622369747",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_public_hostname": "ec2-18-234-133-209.compute-1.amazonaws.com",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_public_ipv4s": "18.234.133.209",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_security_group_ids": "sg-01c34e8a4063c11b3",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_security_groups": "launch-wizard-2",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_subnet_id": "subnet-04408e1f235f09046",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_subnet_ipv4_cidr_block": "172.31.16.0/20",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_vpc_id": "vpc-0f2ef5d2d9ef7bc47",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_vpc_ipv4_cidr_block": "172.31.0.0/16",
        "ansible_ec2_network_interfaces_macs_0a_7f_a4_f5_69_5b_vpc_ipv4_cidr_blocks": "172.31.0.0/16",
        "ansible_ec2_placement_availability_zone": "us-east-1d",
        "ansible_ec2_placement_availability_zone_id": "use1-az4",
        "ansible_ec2_placement_region": "us-east-1",
        "ansible_ec2_profile": "default-hvm",
        "ansible_ec2_public_hostname": "ec2-18-234-133-209.compute-1.amazonaws.com",
        "ansible_ec2_public_ipv4": "18.234.133.209",
        "ansible_ec2_public_key": "",
        "ansible_ec2_reservation_id": "r-0986b1770c18820c5",
        "ansible_ec2_security_groups": "launch-wizard-2",
        "ansible_ec2_services_domain": "amazonaws.com",
        "ansible_ec2_services_partition": "aws",
        "ansible_ec2_system": "xen",
        "ansible_ec2_user_data": "None"
    }
}

TASK [get specific value] ***********************************************************************************************************************************
ok: [localhost]

TASK [Print value] ******************************************************************************************************************************************
ok: [localhost] => {
    "msg": "----------------ami-08c40ec9ead489470"
}
