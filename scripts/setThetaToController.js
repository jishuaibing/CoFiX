const ERC20 = artifacts.require("ERC20");
const { BN } = require('@openzeppelin/test-helpers');
const { web3 } = require('@openzeppelin/test-environment');
const Decimal = require('decimal.js');
const CoFiXController = artifacts.require("CoFiXController");

const argv = require('yargs').argv;

module.exports = async function (callback) {

    try {
        var Controller;
        var Token;

        console.log(`argv> oracle=${argv.controller}, token=${argv.token}, ethAmount=${argv.theta}`);

        Controller = await CoFiXController.at(argv.controller);

        Token = await ERC20.at(argv.token);

        let symbol = await Token.symbol();
        console.log(`token symbol=${symbol}, address=${Token.address}`);

        // getKInfo
        let kInfo = await Controller.getKInfo(Token.address);
        console.log(`before> kInfo.k=${kInfo.k}, kInfo.updatedAt=${kInfo.updatedAt}, kInfo.theta=${kInfo.theta}`);

        // setTheta
        await Controller.setTheta(Token.address, argv.theta);

        // getKInfo
        kInfo = await Controller.getKInfo(Token.address);
        console.log(`after> kInfo.k=${kInfo.k}, kInfo.updatedAt=${kInfo.updatedAt}, kInfo.theta=${kInfo.theta}`);

        callback();
    } catch (e) {
        callback(e);
    }
}