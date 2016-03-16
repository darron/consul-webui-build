class ConsulWebui < FPM::Cookery::Recipe
  name 'consul-webui'

  version '0.6.4'
  revision '1'
  description 'Admin web UI for Consul.'

  homepage 'https://github.com/hashicorp/consul/tree/master/ui'
  source "https://releases.hashicorp.com/consul/#{version}/consul_#{version}_web_ui.zip"
  sha256 '5f8841b51e0e3e2eb1f1dc66a47310ae42b0448e77df14c83bb49e0e0d5fa4b7'

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
