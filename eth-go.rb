require 'formula'

class EthGo < Formula

  VERSION = '0.3.1'

  homepage 'https://github.com/ethereum/eth-go'
  head 'https://github.com/ethereum/eth-go.git', :branch => 'develop'
  url 'https://github.com/ethereum/eth-go.git', :branch => 'master', :revision => '6a86c517c4f4b372cad0ae1d92e926a482eac5ba'
  version VERSION

  depends_on 'go'
  depends_on 'mercurial'
  depends_on 'gmp'
  depends_on 'leveldb'

  keg_only "No executable"

  def install
    system "
    export PATH=/usr/local/bin/:${PATH};
    export GOPATH=/tmp/go/:`brew --prefix go`/share;
    mkdir -p /tmp/go/src/github.com/ethereum;
    rm -rf /tmp/go/src/github.com/ethereum/eth-go;
    ln -sf `pwd` /tmp/go/src/github.com/ethereum/eth-go;
    "

    lib.install Dir['*']
  end

  test do
    system "echo "
  end

end

__END__
