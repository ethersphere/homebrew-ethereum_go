require 'formula'

class GoEthereum < Formula

  homepage 'https://github.com/ethereum/go-ethereum'
  head 'https://github.com/ethereum/go-ethereum.git', :branch => 'develop'
  url 'https://github.com/ethereum/go-ethereum.git', :branch => 'master', :revision => '30c5922aa4c5d3e0bc730f2bf05b18be661c78b2'
  version '0.3.1'

  depends_on 'qt5'
  depends_on 'pkg-config'
  depends_on 'eth-go'

  def install
    version = build.head? ? 'HEAD' : '0.3.1'
    executable = "go-ethereum-#{version}"

    system "
    export PATH=/usr/local/bin/:${PATH};
    export GOPATH=/tmp/go/:`brew --prefix go`/share;
    mkdir -p /tmp/go/src/github.com/ethereum;
    rm -rf /tmp/go/src/github.com/ethereum/eth-go;
    ln -sf `brew --prefix`/Cellar/eth-go/#{version}/lib /tmp/go/src/github.com/ethereum/eth-go
    rm -rf /tmp/go/src/github.com/ethereum/go-ethereum;
    ln -sf `pwd` /tmp/go/src/github.com/ethereum/go-ethereum;
    export PKG_CONFIG_PATH=`brew --prefix qt5`/lib/pkgconfig;
    export QT5VERSION=`pkg-config --modversion Qt5Core`;
    export CGO_CPPFLAGS=-I`brew --prefix qt5`/include/QtCore/$QT5VERSION/QtCore;
    go get .;
    go build -v;
    mv go-ethereum* #{executable};
    "

    bin.install executable
  end

  test do
    system "go-ethereum -m -gui=false"
  end

end

__END__
