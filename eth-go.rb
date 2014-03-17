require 'formula'

class EthGo < Formula

  homepage 'https://github.com/ethereum/eth-go'
  head 'https://github.com/ethereum/eth-go.git', :branch => 'develop'
  url 'https://github.com/ethereum/eth-go.git', :branch => 'master', :revision => 'c1d0ea7366f1bad134c985dbe1f272d376e5ec9b'
  version '0.3.1'

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
    go get .;
    go build -v
    "

    lib.install Dir['*']
  end

  test do
    system "echo "
  end

end

__END__
