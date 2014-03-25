homebrew-ethereum-go
====================

Homebrew Tap for Ethereum Go Implementation

This tap contains 3 kegs: 
- eth-go: the keg only ethereum go library, see https://github.com/ethereum/eth-go 
- go-ethereum, the full node client command line and dev console, https://github.com/ethereum/go-ethereum/ethereum
- go-ethereal, the GUI client, see https://github.com/ethereum/go-ethereum/ethereal

go-ethereum and go-ethereal depend on and install eth-go.

##Installation

```
brew tap ethersphere/ethereum_go
brew install go-ethereum  # node client 
brew install go-ethereal  # GUI client
```

These will install the latest stable clients. The executables are called `go-ethereum-VERSION` and `go-ethereal-VERSION`.

To get the latest edge build, do:
```
brew install eth-go --HEAD
brew unlink go-ethereum
brew reinstall go-ethereum --HEAD
brew unlink go-ethereal
brew reinstall go-ethereal --HEAD
```

These will install the edge clients built from the develop branch. The executables are called `go-ethereum-HEAD` and `go-ethereal-HEAD`. 

Note:
- you do need to explicitly install eth-go from HEAD too.
- if you call unlink before install you can have parallel versions of the clients (i.e., both `go-ethereum-HEAD` and `go-ethereum-0.3.1`). These executables will be avaiable in `$(brew --cellar)/go-ethereum/VERSION/bin`.
- by calling reinstall instead of install you make sure the most recent version is installed even if you had installed from (a possibly earlier) HEAD before.
- If you have not previously installed dependencies try to make sure homebrew does not compile dependencies from source (qt5 may take several hours): https://github.com/Homebrew/homebrew/wiki/FAQ#why-do-you-compile-everything. 

##eth-go only

If you only want to install eth-go:

```
brew tap ethersphere/ethereum-go
brew install eth-go
```

To get the latest edge build, do:
```
brew install eth-go --HEAD
```

##Options

See `brew info go-ethereum` and use `--verbose` and/or `--debug` to get more info while installing.

##Troubleshooting

* Make sure to update XCode (latest is 5.1) and the command line tools.
* Run `brew update` and `brew upgrade`
* Fix what the `brew doctor` says
* Reinstall dependencies
* Make changes to `/usr/local/Library/Taps/ethersphere/*.rb`
* Reinstall with `brew reinstall go-ethereum.rb` (send a pull request!)
* Take a walk

For the record, the brewable dependencies are

    brew install go mercurial gmp leveldb  # for eth-go and go-ethereum
    brew install pkg-config qt5 # extra for go-ethereal GUI

## Credits
* https://github.com/zelig
* https://github.com/caktux
* https://github.com/obscuren

##Source code and info
* https://github.com/ethereum/eth-go
* https://github.com/ethereum/go-ethereum
* https://github.com/ethereum/go-ethereum/wiki

## Disclaimer

The ethereum project is in inception phase. All software and tools being developed are alpha. Adjust your expectations.
