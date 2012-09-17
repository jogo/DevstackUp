# Override these values with a local config defined in VD_CONF
conf = {
    'ip_prefix' => '192.168.27',
    'mac_prefix' => '080027027',
    'box_name' => 'precise',
    'box_url' => 'http://files.vagrantup.com/precise64.box',
    'allocate_memory' => 3072,
    'cache_dir' => 'cache/',
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

  Vagrant::Config.run do |config|
    config.vm.network(:hostonly, ip, :mac => mac)
  end

  ssh_dir = conf['ssh_dir']
  config.vm.share_folder("v-ssh", "/home/vagrant/.host-ssh", ssh_dir)

  Vagrant::Config.run  do |config|
    config.vm.provision :shell, :inline =>
      "cp /vagrant/load.sh .; su vagrant -c './load.sh'"
    end
end
