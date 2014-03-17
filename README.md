homebrew-ethereum-go
====================

Homebrew Tap for Ethereum Go Implementation

##Installation

```
brew tap ethersphere/ethereum_go
brew install go-ethereum 
```

To get the latest edge build, do:
```
brew install go-ethereum --HEAD
```

These brews can be installed via the raw GitHub URLs, or by cloning this
repository locally with `brew tap ethersphere/ethereum-go`.

##eth-go only

This tap contains 2 kegs: one for eth-go, one for go-ethereum. go-ethereum depends on and installs eth-go. But if you only want to install eth-go:

```
brew tap ethersphere/ethereum-go
brew install eth-go
```

To get the latest edge build, do:
```
brew install eth-go --HEAD
```

##Options

See `brew info go-ethereum` and use `--verbose` to get more info while installing.

##Troubleshooting

* Make sure to update XCode (latest is 5.1) and the command line tools.
* Run `brew update` and `brew upgrade`
* Fix what the `brew doctor` says
* Reinstall dependencies
* Make changes to `/usr/local/Library/Taps/ethersphere/*.rb`
* Reinstall with `brew reinstall ethereum.rb` (send a pull request!)
* Take a walk

## Credits
* https://github.com/zelig
* https://github.com/caktux
* https://github.com/obscuren

##Source code and info
* https://github.com/ethereum/eth-go
* https://github.com/ethereum/go-ethereum

## Disclaimer

The ethereum project is in inception phase. All software and tools being developed are alpha. Adjust your expectations.
