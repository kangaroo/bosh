#!/usr/bin/env bash
#
# Copyright (c) 2009-2012 VMware, Inc.

set -e

# When building with an apt-cache-ng proxy using http_proxy, rubygems will
# attempt to use the proxy during build and get a 403 CONNECT, lets unset it before
# attempting to build micro_bosh
unset http_proxy

base_dir=$(readlink -nf $(dirname $0)/../..)
source $base_dir/lib/prelude_apply.bash
source $base_dir/lib/prelude_bosh.bash

mkdir -p $chroot/$bosh_dir/src/micro_bosh/bosh-release
if [ -z "${agent_gem_src_url:-}" ]; then
  cp -rvH $assets_dir/gems $chroot/$bosh_dir/src/micro_bosh/bosh-release/gems
fi

cp -rH $bosh_micro_manifest_yml_path $chroot/$bosh_dir/src/micro_bosh/release.yml
cp -rH $bosh_micro_release_tgz_path $chroot/$bosh_dir/src/micro_bosh/release.tgz
cp $dir/assets/configure_micro_bosh.sh $chroot/$bosh_dir/src/micro_bosh/configure_micro_bosh.sh

run_in_bosh_chroot $chroot "$bosh_dir/src/micro_bosh/configure_micro_bosh.sh ${stemcell_infrastructure} ${agent_gem_src_url:-}"

# Copy the generated apply spec to stemcell directory
mkdir -p $work/stemcell
cp $chroot/$bosh_app_dir/micro/apply_spec.yml $work/stemcell
