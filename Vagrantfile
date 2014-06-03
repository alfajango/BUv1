# -*- mode: ruby -*-
# vi: set ft=ruby :

# PG, based on jwmatthews' file for SBS

$setup_script = <<EOF
cd /vagrant/devel-env/el6
./setup_prietary.sh | tee log_setup_prietary
./run_rails.sh
EOF

Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  config.vm.box = "centos65-x86_64-20131205.box"
 config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
  config.vm.hostname = "prietary.example.com"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "172.31.2.50"

  config.vm.provision :shell, :inline => $setup_script
end
