require 'formula'

class GoEthereumGui < Formula

  version '0.3.1'

  homepage 'https://github.com/ethereum/go-ethereum'
  head 'https://github.com/ethereum/go-ethereum.git', :branch => 'develop'
  url 'https://github.com/ethereum/go-ethereum.git', :branch => 'master', :revision => '642630db15a793cf0a0f7fbd827daee364df5423'

  depends_on 'qt5'
  depends_on 'pkg-config'
  depends_on 'eth-go'

  def executable
    "go-ethereum-gui-#{version}"
  end

  def install
    system "
    export PATH=/usr/local/bin/:${PATH};
    export GOPATH=/tmp/go/;
    mkdir -p /tmp/go/src/github.com/ethereum;
    rm -rf /tmp/go/src/github.com/ethereum/eth-go;
    ln -sf `brew --cellar`/eth-go/#{version}/lib /tmp/go/src/github.com/ethereum/eth-go
    rm -rf /tmp/go/src/github.com/ethereum/go-ethereum;
    ln -sf `pwd` /tmp/go/src/github.com/ethereum/go-ethereum;
    export PKG_CONFIG_PATH=`brew --prefix qt5`/lib/pkgconfig;
    export QT5VERSION=`pkg-config --modversion Qt5Core`;
    export CGO_CPPFLAGS=-I`brew --prefix qt5`/include/QtCore/$QT5VERSION/QtCore;
    cd ethereal
    go get .;
    go build -v;
    mv ethereal #{executable};
    mkdir -p go-ethereum-gui
    mv assets go-ethereum-gui
    "

    bin.install "ethereal/#{executable}"
    share.install "ethereal/go-ethereum-gui"
  end

  test do
    system executable
  end

end

__END__
