homebrew-ethereum-go
====================

Homebrew Tap for Ethereum Go Implementation

This tap contains 3 kegs: 
- eth-go: the keg only ethereum go library, see https://github.com/ethereum/eth-go 
- go-ethereum-cli, the full node client command line interface and dev console, https://github.com/ethereum/go-ethereum/ethereum
- go-ethereum-gui, the GUI client, see https://github.com/ethereum/go-ethereum/ethereal

go-ethereum-cli and go-ethereum-gui depend on and install eth-go.

##Installation

```
brew tap ethersphere/ethereum_go
brew install go-ethereum  # node client 
brew install go-ethereal  # GUI client
```

These will install the latest stable clients. The executables are called `go-ethereum-cli-VERSION` and `go-ethereum-gui-VERSION`. This naming pattern is chosen to allow most informative names and parallel installation of multiple ethereum implementations.

To get the latest edge build, do:
```
brew install eth-go --HEAD
brew unlink go-ethereum-cli
brew reinstall go-ethereum-cli --HEAD
brew unlink go-ethereum-gui
brew reinstall go-ethereum-gui --HEAD
```

These will install the edge clients built from the develop branch. The executables are called `go-ethereum-cli-HEAD` and `go-ethereum-gui-HEAD`. 

Note:
- you do need to explicitly install eth-go from HEAD too.
- if you call unlink before install you can have parallel versions of the clients (i.e., both `go-ethereum-cli-HEAD` and `go-ethereum-cli-0.3.1`). These executables will be avaiable in `$(brew --cellar)/go-ethereum-cli/VERSION/bin`.
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

See `brew info go-ethereum-cli` and use `--verbose` and/or `--debug` to get more info while installing.

##Troubleshooting

* Make sure to update XCode (latest is 5.1) and the command line tools.
* Run `brew update` and `brew upgrade`
* Fix what the `brew doctor` says
* Reinstall dependencies
* Make changes to `/usr/local/Library/Taps/ethersphere/*.rb`
* Reinstall with `brew reinstall go-ethereum-cli.rb` (send a pull request!)
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

## C++ implementation 
There is a separate homebrew tap for the C++ implementation of ethereum: https://github.com/caktux/homebrew-ethereum
I hope it adopts the naming scheme.

## Disclaimer

The ethereum project is in inception phase. All software and tools being developed are alpha. Adjust your expectations.

