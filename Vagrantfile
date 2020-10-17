# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vagrant.plugins = ["vagrant-reload", "vagrant-scp"]
end

nodejs_box_vagrantfile = './vagrant/Vagrantfile.nodejs-box'
load nodejs_box_vagrantfile if File.exists?(nodejs_box_vagrantfile)
