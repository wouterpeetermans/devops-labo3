Vagrant.configure("2") do |config|
	config.vm.provider "virtualbox" do |v|
		v.memory = 512
		v.cpus = 1
	end
	config.vm.box = "ubuntu/xenial64"
	config.vm.define "mgr" do |mgr|
		mgr.vm.hostname = "mgr.site"
		mgr.vm.network "private_network", ip: "192.168.50.62", netmask: "26", 
			virtualbox__intnet: "lb_net"
		mgr.vm.network "private_network", ip: "192.168.50.126", netmask: "26",
			virtualbox__intnet: "db_net"
		mgr.vm.provision "shell", path: "bootstrap.sh"
	end
	config.vm.define "lb" do |lb|
		lb.vm.hostname = "lb.site"
		lb.vm.network "private_network", ip: "192.168.50.2", netmask: "26",
			virtualbox__intnet: "lb_net"
		lb.vm.provision "shell", path: "bootstrap.sh"
	end
	config.vm.define "db" do |db|
		db.vm.hostname = "db.site"
		db.vm.network "private_network", ip: "192.168.50.65", netmask: "26",
			virtualbox__intnet: "db_net"
		db.vm.provision "shell", path: "bootstrap.sh"
	end
	(1..4).each do |i|
		config.vm.define "cash#{i}" do |cash|
			cash.vm.hostname = "cash#{i}.site"
			cash.vm.network "private_network", ip: "192.168.50.#{10+i}", netmask: "26",
				virtualbox__intnet: "lb_net"
			cash.vm.network "private_network", ip: "192.168.50.#{125+(i*4)}", netmask: "30",
				virtualbox__intnet: "cash_net#{i}"
			cash.vm.provision "shell", path: "bootstrap.sh"
		end
	end
	(1..4).each do |i|
		config.vm.define "app#{i}" do |app|
			app.vm.hostname = "app#{i}.site"
			app.vm.network "private_network", ip: "192.168.50.#{70+i}", netmask: "26",
				virtualbox__intnet: "db_net"
			app.vm.network "private_network", ip: "192.168.50.#{126+(i*4)}", netmask: "30",
				virtualbox__intnet: "cash_net#{i}"
			app.vm.provision "shell", path: "bootstrap.sh"
		end
	end

	
end
