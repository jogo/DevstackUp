conf = {
    'ip_prefix' => '192.168.27',
    'mac_prefix' => '080027027',
    'box_name' => 'devstack',
    'box_url' => 'http://files.vagrantup.com/precise64.box',
    'allocate_memory' => 3072,
    'ssh_dir' => '~/.ssh/',
}

Vagrant::Config.run do |config|

  config.vm.box = conf['box_name']
  config.vm.box_url = conf['box_url']

  memory = conf['allocate_memory'].to_s()
  config.vm.customize ["modifyvm", :id, "--memory", memory]

  suffix = "100"

  ip_prefix = conf['ip_prefix']
  ip = "#{ip_prefix}.#{suffix}"

  mac_prefix = conf['mac_prefix']
  mac = "#{mac_prefix}#{suffix}"

  config.vm.network(:private_network, ip, :mac => mac)

  # For horizon
  config.vm.forward_port 80, 8080

  ssh_dir = conf['ssh_dir']
  config.vm.share_folder("v-ssh", "/home/vagrant/.host-ssh", ssh_dir)

  config.vm.provision :shell, :inline =>
    "cp /vagrant/load.sh .; su vagrant -c './load.sh'"
end
