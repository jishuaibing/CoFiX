# Steps to change CoFiXController

```shell
truffle exec scripts/deployOracleMock.js --network ropsten --nest 0xB9746A8572DB5C27597fE88B86B6520599Bf62d4
```

```shell
truffle exec scripts/deployController.js --network ropsten --nest 0xB9746A8572DB5C27597fE88B86B6520599Bf62d4 --factory 0xDDe373ef91a4a362078f405194be54dE0a9636F4 --oracle 0x2183B4bC72c299FDDFf27D4bDBc635bbc8cA5e44 --table 0xDB69107004694428aab5E6F196dcdd588F52B745
```

```shell
truffle exec scripts/setControllerToFactory.js --network ropsten --factory 0xDDe373ef91a4a362078f405194be54dE0a9636F4 --controller 0xe1f60D39434272BbFFc2245CE1C6194BC728978E
```

```shell
truffle exec scripts/feedPriceToConstOracleMock.js --network ropsten --token 0x9aA0AF152cf141740f19D335b5ddE1F0E51008A7  --ethAmount "10000000000000000000" --tokenAmount "339880000000000000" --oracle 0x2183B4bC72c299FDDFf27D4bDBc635bbc8cA5e44
```

```shell
truffle exec scripts/feedPriceToConstOracleMock.js --network ropsten --token 0xD52d3bfCA0d39E4bD5378e0BBa8AD245C3F58C17  --ethAmount "10000000000000000000" --tokenAmount "3862600000" --oracle 0x2183B4bC72c299FDDFf27D4bDBc635bbc8cA5e44
```

```shell
truffle exec scripts/setThetaToController.js --network ropsten --controller 0xe1f60D39434272BbFFc2245CE1C6194BC728978E  --token 0xD52d3bfCA0d39E4bD5378e0BBa8AD245C3F58C17 --theta 10
```

```shell
truffle exec scripts/setThetaToController.js --network ropsten --controller 0xe1f60D39434272BbFFc2245CE1C6194BC728978E  --token 0x9aA0AF152cf141740f19D335b5ddE1F0E51008A7 --theta 10
```