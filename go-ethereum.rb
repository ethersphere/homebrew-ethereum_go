require 'formula'

class GoEthereum < Formula

  version '0.3.1'

  homepage 'https://github.com/ethereum/go-ethereum'
  head 'https://github.com/ethereum/go-ethereum.git', :branch => 'develop'
  url 'https://github.com/ethereum/go-ethereum.git', :branch => 'master', :revision => '642630db15a793cf0a0f7fbd827daee364df5423'

  depends_on 'eth-go'

  def executable
    "go-ethereum-#{version}"
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
    cd ethereum
    go get .;
    go build -v;
    mv ethereum #{executable};
    "

    bin.install "ethereum/#{executable}"
  end

  test do
    system "#{executable} -m"
  end

end

__END__
