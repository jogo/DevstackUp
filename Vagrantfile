conf = {
    'ip_prefix' => '192.168.27',
    'box_name' => 'devstack',
    'box_url' => 'http://files.vagrantup.com/precise64.box',
    'allocate_memory' => 3072,
    'ssh_dir' => '~/.ssh/',
}

suffix = "100"


ip_prefix = conf['ip_prefix']
ip = "#{ip_prefix}.#{suffix}"


Vagrant.configure("1") do |config|
  config.vm.network(:hostonly, ip)
end


Vagrant.configure("2") do |config|
  config.vm.network "private_network", ip: ip
end


Vagrant::Config.run do |config|

  config.vm.box = conf['box_name']
  config.vm.box_url = conf['box_url']

  memory = conf['allocate_memory'].to_s()
  config.vm.customize ["modifyvm", :id, "--memory", memory]

  # For horizon
  config.vm.forward_port 80, 8080

  ssh_dir = conf['ssh_dir']
  config.vm.share_folder("v-ssh", "/home/vagrant/.host-ssh", ssh_dir)

  config.vm.provision :shell, :inline =>
    "cp /vagrant/load.sh .; su vagrant -c './load.sh'"
end
