# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vagrant.plugins = ["vagrant-reload", "vagrant-scp"]
end

nodejs_centos7_vagrantfile = './vagrant/Vagrantfile.nodejs-centos7'
load nodejs_centos7_vagrantfile if File.exists?(nodejs_centos7_vagrantfile)

nodejs_ubuntu1804_vagrantfile = './vagrant/Vagrantfile.nodejs-ubuntu1804'
load nodejs_ubuntu1804_vagrantfile if File.exists?(nodejs_ubuntu1804_vagrantfile)
