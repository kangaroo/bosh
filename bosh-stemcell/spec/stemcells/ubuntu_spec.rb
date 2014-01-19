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
      'adduser' => '3.113+nmu3ubuntu1',
      'apt' => '0.9.7.7ubuntu6',
      'apt-utils' => '0.9.7.7ubuntu6',
      'bzip2' => '1.0.6-4',
      'console-setup' => '1.70ubuntu7',
      'dash' => '0.5.7-3ubuntu1',
      'debconf' => '1.5.49ubuntu1',
      'isc-dhcp-client' => '4.2.4-5ubuntu2.1',
      'eject' => '2.1.5+deb1+cvs20081104-13',
      'gnupg' => '1.4.12-7ubuntu1.3',
      'ifupdown' => '0.7.5ubuntu2.2',
      'initramfs-tools' => '0.103ubuntu0.8',
      'iproute' => '20121211-2ubuntu1',
      'iputils-ping' => '3:20101006-3ubuntu1',
      'kbd' => '1.15.5-1ubuntu1',
      'less' => '456-1ubuntu1',
      'locales' => '2.13+git20120306-9',
      'lsb-release' => '4.0-0ubuntu27.3',
      'makedev' => '2.3.1-92ubuntu1',
      'mawk' => '1.3.3-17ubuntu1',
      'module-init-tools' => '9-3ubuntu1',
      'net-tools' => '1.60-24.2ubuntu1',
      'netbase' => '5.0ubuntu1',
      'netcat-openbsd' => '1.105-7ubuntu1',
      'ntpdate' => '1:4.2.6.p5+dfsg-2ubuntu1',
      'passwd' => '1:4.1.5.1-1ubuntu4.1',
      'procps' => '1:3.3.3-2ubuntu5.3',
      'python3' => '3.3.1-0ubuntu1',
      'sudo' => '1.8.6p3-0ubuntu3',
      'tzdata' => '2013g-0ubuntu0.13.04',
      'ubuntu-keyring' => '2012.05.19',
      'udev' => '175-0ubuntu26',
      'upstart' => '1.8-0ubuntu1',
      'ureadahead' => '0.100.0-16',
      'vim-tiny' => '2:7.3.547-6ubuntu5',
      'whiptail' => '0.52.14-11ubuntu7'
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end

    describe file('/etc/lsb-release') do
      it { should be_file }
      it { should contain 'DISTRIB_RELEASE=13.04' }
      it { should contain 'DISTRIB_CODENAME=raring' }
    end
  end

  context 'installed by base_apt' do
    {
      'upstart'              => '1.8-0ubuntu1',
      'build-essential'      => '11.6ubuntu4',
      'libssl-dev'           => '1.0.1c-4ubuntu8.2',
      'lsof'                 => '4.86+dfsg-1ubuntu2',
      'strace'               => '4.5.20-2.3ubuntu2',
      'bind9-host'           => '1:9.9.2.dfsg.P1-2ubuntu2.2',
      'dnsutils'             => '1:9.9.2.dfsg.P1-2ubuntu2.2',
      'tcpdump'              => '4.3.0-1ubuntu1',
      'iputils-arping'       => '3:20101006-3ubuntu1',
      'curl'                 => '7.29.0-1ubuntu3.4',
      'wget'                 => '1.14-1ubuntu1',
      'libcurl3'             => '7.29.0-1ubuntu3.4',
      'libcurl4-openssl-dev' => '7.29.0-1ubuntu3.4', # installed because of 'libcurl3-dev'
      'bison'                => '2:2.5.dfsg-3ubuntu1',
      'libreadline6-dev'     => '6.2-9ubuntu1',
      'libxml2'              => '2.9.0+dfsg1-4ubuntu4.3',
      'libxml2-dev'          => '2.9.0+dfsg1-4ubuntu4.3',
      'libxslt1.1'           => '1.1.27-1ubuntu2',
      'libxslt1-dev'         => '1.1.27-1ubuntu2',
      'zip'                  => '3.0-6ubuntu1',
      'unzip'                => '6.0-8ubuntu2',
      'nfs-common'           => '1:1.2.6-3ubuntu2',
      'flex'                 => '2.5.35-10.1ubuntu1',
      'psmisc'               => '22.20-1ubuntu2',
      'apparmor-utils'       => '2.8.0-0ubuntu11',
      'iptables'             => '1.4.12-2ubuntu5',
      'sysstat'              => '10.0.5-1',
      'rsync'                => '3.0.9-4',
      'openssh-server'       => '1:6.1p1-4',
      'traceroute'           => '1:2.0.19-1',
      'libncurses5-dev'      => '5.9-10ubuntu4',
      'quota'                => '4.01-3',
      'libaio1'              => '0.3.109-3',
      'gdb'                  => '7.6~20130417-0ubuntu1',
      'tripwire'             => '2.4.2.2-2',
      'libcap2-bin'          => '1:2.22-1.2ubuntu2',
      'libcap-dev'           => '1:2.22-1.2ubuntu2',
      'libbz2-dev'           => '1.0.6-4',
      'libyaml-dev'          => '0.1.4-2build1',
      'cmake'                => '2.8.10.1-0ubuntu6',
      'scsitools'            => '0.12-2.1ubuntu1',
      'mg'                   => '20110905-1.1',
      'htop'                 => '1.0.2-1',
      'module-assistant'     => '0.11.4',
      'debhelper'            => '9.20120909ubuntu1',
      'runit'                => '2.1.1-6.2ubuntu3',
      'sudo'                 => '1.8.6p3-0ubuntu3',
      'uuid-dev'             => '2.20.1-5.1ubuntu8',
      'libgcrypt11-dev'      => '1.5.0-3ubuntu2.2',
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
      'linux-image-virtual'   => '3.8.0.35.53',
      'linux-headers-virtual' => '3.8.0.35.53',
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
      it { should contain 'title Ubuntu 13.04 (3.8.0-35-generic)' }
      it { should contain '  root (hd0,0)' }
      it { should contain '  kernel /boot/vmlinuz-3.8.0-35-generic ro root=UUID=' }
      it { should contain ' selinux=0' }
      it { should contain '  initrd /boot/initrd.img-3.8.0-35-generic' }
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
