Vagrant.configure("2") do |config|
	config.vm.provider "virtualbox" do |v|
		v.memory = 512
		v.cpus = 1
	end
	config.vm.box = "ubuntu/xenial64"
	config.vm.define "mgr" do |mgr|
		mgr.vm.hostname = "mgr.site"
		mgr.vm.network "private_network", ip: "192.168.50.62", netmask: "26"
		mgr.vm.network "private_network", ip: "192.168.50.126", netmask: "26"
		mgr.vm.provision "shell", path: "bootstrap.sh"
	end
	config.vm.define "lb" do |lb|
		lb.vm.hostname = "lb.site"
		lb.vm.network :private_network, ip: "192.168.50.2"
		lb.vm.provision  "shell", path: "bootstrap.sh"
	end
end
