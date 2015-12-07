class ConsulWebui < FPM::Cookery::Recipe
  name 'consul-webui'

  version '0.6.0'
  revision '1'
  description 'Admin web UI for Consul.'

  homepage 'https://github.com/hashicorp/consul/tree/master/ui'
  source "https://releases.hashicorp.com/consul/#{version}/consul_#{version}_web_ui.zip"
  sha256 '73c5e7ee50bb4a2efe56331d330e6d7dbf46335599c028344ccc4031c0c32eb0'

  maintainer 'Darron Froese <darron@froese.org>'
  vendor 'octohost'

  license 'Mozilla Public License, version 2.0'

  depends 'consul'
  provides 'consul-webui'
  build_depends 'unzip'

  pre_install 'preinst'

  def build
    safesystem 'echo "Nothing to build - it is html."'
  end

  def install
    safesystem "mkdir -p #{destdir}/var/lib/consul/ui"
    safesystem "cp -ar #{builddir}/consul_#{version}_web_ui/* #{destdir}/var/lib/consul/ui/"
  end
end
