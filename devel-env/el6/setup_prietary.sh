#!/bin/bash

source env_vars

# Install RPM based deps
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Using latest MongoDB RPMs from 10gen opposed to EPEL
if [ ! -f /etc/yum/repos.d/10gen.repo ]; then
    cat > /etc/yum.repos.d/10gen.repo << EOF
[10gen]
name=10gen Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64
gpgcheck=0
enabled=1
EOF
fi

yum -y install mongo-10gen mongo-10gen-server
yum -y install libxslt
yum -y install git
chkconfig mongod on
service mongod restart

yum -y install ImageMagick

yum -y install redis
chkconfig redis on
service redis restart

yum -y install elasticsearch
chkconfig elasticsearch on
service elasticsearch restart

# Disable Firewall
chkconfig iptables off
service iptables stop

yum install -y sqlite-devel

# Install rvm with ruby & rails
curl -L https://get.rvm.io | bash -s -- --version latest
source ~/.bash_profile
source ~/.bashrc
#rvm install 1.9.3
rvm install 2.0.0
#rvm use 1.9.3 --default
rvm use 2.0.0 --default
#gem install rails -v 3.2.13
gem install rails -v 3.2.14

# Install Prietary Gems
cd $PRIETARY_HOME
bundle install
echo "Loading Spreadsheet data into mongo"
bundle exec "ruby parser_oops.rb"

echo ""
echo "======="
echo "To ssh into your development environment you may either:"
echo " ssh vagrant@172.31.2.50    (username and password are both 'vagrant') "
echo " vagrant ssh     (from your host machine, this command will ssh automatically into the VM)"
echo "  Note:  on the VM, the git checkout for prietary is shared with the host at the path '/vagrant'"
echo "======="
echo ""
