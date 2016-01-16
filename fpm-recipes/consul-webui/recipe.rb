class ConsulWebui < FPM::Cookery::Recipe
  name 'consul-webui'

  version '0.6.3'
  revision '1'
  description 'Admin web UI for Consul.'

  homepage 'https://github.com/hashicorp/consul/tree/master/ui'
  source "https://releases.hashicorp.com/consul/#{version}/consul_#{version}_web_ui.zip"
  sha256 '93bbb300cacfe8de90fb3bd5ede7d37ae6ce014898edc520b9c96a676b2bbb72'

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
