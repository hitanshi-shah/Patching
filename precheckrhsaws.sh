file2=/home/ubuntu/Ansible_plays/pre_patch/rhsahost

if [ -f ${file2} ];then
    sudo chown jenkins:jenkins /home/ubuntu/Ansible_plays/pre_patch/rhsahost
    sudo chmod 777 /home/ubuntu/Ansible_plays/pre_patch/rhsahost
    sudo cp -p /home/ubuntu/Ansible_plays/pre_patch/rhsahost $1
    sudo cp -p /home/ubuntu/Ansible_plays/pre_patch/rhsahost /var/lib/jenkins/workspace/Linux/Remediation

fi
