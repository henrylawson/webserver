webserver
=========

A simple Chef cookbook to configure my web server.

getting started
===============
* Ensure RVM is installed
* Ensure Vagrant and VirtualBox is installed
* `vagrant box add precise-server-cloudimg-amd64 PATH-TO-FOLDER-WITH/precise-server-cloudimg-amd64-vagrant-disk1.box`
* `vagrant plugin install vagrant-berkshelf`
* `vagrant plugin install vagrant-omnibus`
* `gem install bundler`
* `bundle install`
* `cp -r PATH-TO-FOLDER-WITH/Certificates files/default/certificates/`
* `vagrant up`

