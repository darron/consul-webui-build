class ConsulWebui < FPM::Cookery::Recipe
  name 'consul-webui'

  version '0.5.0'
  revision '2'
  description 'Admin web UI for Consul.'

  homepage 'https://github.com/hashicorp/consul/tree/master/ui'
  source "https://dl.bintray.com/mitchellh/consul/#{version}_web_ui.zip"
  sha256 '0081d08be9c0b1172939e92af5a7cf9ba4f90e54fae24a353299503b24bb8be9'

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
    safesystem "cp -ar #{builddir}/#{version}_web_ui/dist/* #{destdir}/var/lib/consul/ui/"
  end
end
