default["cloudhsm_auto"]["region"] = "eu-west-2"
default["cloudhsm_auto"]["staging_dir"] = "/cloudhsm-auto-stage"
default["cloudhsm_auto"]["cloudhsm_client_src_uri"] = "https://s3.amazonaws.com/cloudhsmv2-software/CloudHsmClient/EL7/cloudhsm-client-latest.el7.x86_64.rpm"
default["cloudhsm_auto"]["cloudhsm_client_dst"] = "#{default["cloudhsm_auto"]["staging_dir"]}/cloudhsm-client-latest.el7.x86_64.rpm"
default["cloudhsm_auto"]["owner"] = "ec2-user"
default["cloudhsm_auto"]["group"] = "ec2-user"

# Python CloudHSM helper script repository attrs
default["cloudhsm_auto"]["py_cloudhsm_utils_repo"] = "https://github.com/spitchfork/py-aws-cloudhsm-utils.git"
default["cloudhsm_auto"]["py_cloudhsm_utils_dir"] = "#{default["cloudhsm_auto"]["staging_dir"]}/py-aws-cloudhsm-utils"
default["cloudhsm_auto"]["py_cloudhsm_utils_rev"] = "main"

# Python pip dependencies
default["cloudhsm_auto"]["py_cloudhsm_utils_req_cmd"] = "pip3 install -r #{default["cloudhsm_auto"]["py_cloudhsm_utils_dir"]}/requirements.txt"

# Python CloudHSM helper script name attrs
default["cloudhsm_auto"]["py_cloudhsm_utils_create_cmd"] = "python3 create_hsm_cluster.py"
default["cloudhsm_auto"]["py_cloudhsm_utils_conf_secgrp_cmd"] = "python3 configure_security_groups.py"
default["cloudhsm_auto"]["py_cloudhsm_utils_create_hsm_cmd"] = "python3 create_hsm.py"