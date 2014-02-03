require 'spec_helper'

describe 'Ubuntu Stemcell' do
  it_behaves_like 'a stemcell'

  describe package('apt') do
    it { should be_installed }
  end

  describe package('rpm') do
    it { should_not be_installed }
  end

  context 'installed by base_debootstrap' do
    {
      'adduser' => '3.113+nmu3ubuntu3',
      'apt' => '0.9.14.1ubuntu2',
      'apt-utils' => '0.9.14.1ubuntu2',
      'bzip2' => '1.0.6-5',
      'console-setup' => '1.70ubuntu8',
      'dash' => '0.5.7-3ubuntu1',
      'debconf' => '1.5.51ubuntu1',
      'isc-dhcp-client' => '4.2.4-7ubuntu8',
      'eject' => '2.1.5+deb1+cvs20081104-13',
      'gnupg' => '1.4.16-1ubuntu1',
      'ifupdown' => '0.7.47.2ubuntu1',
      'initramfs-tools' => '0.103ubuntu3',
      'iproute2' => '3.12.0-1',
      'iputils-ping' => '3:20121221-1ubuntu1',
      'kbd' => '1.15.5-1ubuntu1',
      'less' => '458-2',
      'locales' => '2.13+git20120306-9',
      'lsb-release' => '4.1+Debian11ubuntu4',
      'makedev' => '2.3.1-93ubuntu1',
      'mawk' => '1.3.3-17ubuntu1',
      'module-init-tools' => '15-0ubuntu5',
      'net-tools' => '1.60-25ubuntu2',
      'netbase' => '5.2',
      'netcat-openbsd' => '1.105-7ubuntu1',
      'ntpdate' => '1:4.2.6.p5+dfsg-3ubuntu2',
      'passwd' => '1:4.1.5.1-1ubuntu8',
      'procps' => '1:3.3.9-1ubuntu2',
      'python3' => '3.3.2-17ubuntu1',
      'sudo' => '1.8.9p4-1ubuntu1',
      'tzdata' => '2013i-1',
      'ubuntu-keyring' => '2012.05.19',
      'udev' => '204-5ubuntu10',
      'upstart' => '1.11-0ubuntu2',
      'ureadahead' => '0.100.0-16',
      'vim-tiny' => '2:7.4.052-1ubuntu3',
      'whiptail' => '0.52.15-2ubuntu4',
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end

    describe file('/etc/lsb-release') do
      it { should be_file }
      it { should contain 'DISTRIB_RELEASE=14.04' }
      it { should contain 'DISTRIB_CODENAME=trusty' }
    end
  end

  context 'installed by base_apt' do
    {
      'upstart'              => '1.11-0ubuntu2',
      'build-essential'      => '11.6ubuntu6'
      'libssl-dev'           => '1.0.1f-1ubuntu1'
      'lsof'                 => '4.86+dfsg-1ubuntu2'
      'strace'               => '4.8-1ubuntu4'
      'bind9-host'           => '1:9.9.3.dfsg.P2-4ubuntu3'
      'dnsutils'             => '1:9.9.3.dfsg.P2-4ubuntu3'
      'tcpdump'              => '4.5.1-2ubuntu1'
      'iputils-arping'       => '3:20121221-1ubuntu1'
      'curl'                 => '7.35.0-1ubuntu1'
      'wget'                 => '1.14-5ubuntu1'
      'libcurl3'             => '7.35.0-1ubuntu1'
      'libcurl4-openssl-dev' => '7.35.0-1ubuntu1'
      'bison'                => '2:3.0.2.dfsg-2'
      'libreadline6-dev'     => '6.2-9ubuntu1'
      'libxml2'              => '2.9.1+dfsg1-3ubuntu3'
      'libxml2-dev'          => '2.9.1+dfsg1-3ubuntu3'
      'libxslt1.1'           => '1.1.28-2'
      'libxslt1-dev'         => '1.1.28-2'
      'zip'                  => '3.0-8'
      'unzip'                => '6.0-9ubuntu1'
      'nfs-common'           => '1:1.2.8-5ubuntu1'
      'flex'                 => '2.5.35-10.1ubuntu2'
      'psmisc'               => '22.20-1ubuntu2'
      'apparmor-utils'       => '2.8.0-0ubuntu38'
      'iptables'             => '1.4.21-1ubuntu1'
      'sysstat'              => '10.2.0-1'
      'rsync'                => '3.1.0-2'
      'openssh-server'       => '1:6.4p1-2'
      'traceroute'           => '1:2.0.19-3'
      'libncurses5-dev'      => '5.9+20131221-1ubuntu1'
      'quota'                => '4.01-3'
      'libaio1'              => '0.3.109-4'
      'gdb'                  => '7.6.50.20131218-0ubuntu1'
      'tripwire'             => '2.4.2.2-3'
      'libcap2-bin'          => '1:2.22-1.2ubuntu2'
      'libcap-dev'           => '1:2.22-1.2ubuntu2'
      'libbz2-dev'           => '1.0.6-5'
      'libyaml-dev'          => '0.1.4-3ubuntu1'
      'cmake'                => '2.8.12.1-1ubuntu5'
      'scsitools'            => '0.12-2.2ubuntu1'
      'mg'                   => '20110905-1.1'
      'htop'                 => '1.0.2-3'
      'module-assistant'     => '0.11.6'
      'debhelper'            => '9.20131127ubuntu2'
      'runit'                => '2.1.1-6.2ubuntu3'
      'sudo'                 => '1.8.9p4-1ubuntu1'
      'uuid-dev'             => '2.20.1-5.1ubuntu14'
      'libgcrypt11-dev'      => '1.5.3-2ubuntu4'
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end

    describe file('/sbin/rescan-scsi-bus') do
      it { should be_file }
      it { should be_executable }
    end
  end

  context 'installed by system_grub' do
    {
      'grub' => '0.97-29ubuntu66',
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end

    %w(e2fs_stage1_5 stage1 stage2).each do |grub_stage|
      describe file("/boot/grub/#{grub_stage}") do
        it { should be_file }
      end
    end
  end

  context 'installed by system_kernel' do
    {
      'linux-image-virtual'   => '3.13.0.6.10',
      'linux-headers-virtual' => '3.13.0.6.10',
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end
  end

  context 'installed by image_install_grub' do
    describe file('/boot/grub/grub.conf') do
      it { should be_file }
      it { should contain 'default=0' }
      it { should contain 'timeout=1' }
      it { should contain 'title Ubuntu 14.04 (3.13.0-6-generic)' }
      it { should contain '  root (hd0,0)' }
      it { should contain '  kernel /boot/vmlinuz-3.13.0-6-generic ro root=UUID=' }
      it { should contain ' selinux=0' }
      it { should contain '  initrd /boot/initrd.img-3.13.0-6-generic' }
    end

    describe file('/boot/grub/menu.lst') do
      before { pending 'until aws/openstack stop clobbering the symlink with "update-grub"' }
      it { should be_linked_to('./grub.conf') }
    end
  end

  context 'installed by bosh_user' do
    describe file('/etc/passwd') do
      it { should be_file }
      it { should contain '/home/vcap:/bin/bash' }
    end
  end

  context 'installed by system_parameters' do
    describe file('/var/vcap/bosh/etc/operating_system') do
      it { should contain('ubuntu') }
    end
  end

  context 'installed by bosh_harden' do
    describe 'disallow unsafe setuid binaries' do
      subject { backend.run_command('find / -xdev -perm +6000 -a -type f')[:stdout].split }

      it { should match_array(%w(/bin/su /usr/bin/sudo)) }
    end

    describe 'disallow root login' do
      subject { file('/etc/ssh/sshd_config') }

      it { should contain /^PermitRootLogin no$/ }
    end
  end

  context 'installed by system-aws-network', exclude_on_vsphere: true do
    describe file('/etc/network/interfaces') do
      it { should be_file }
      it { should contain 'auto eth0' }
      it { should contain 'iface eth0 inet dhcp' }
    end
  end
end
