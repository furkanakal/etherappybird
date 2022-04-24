const  Web3  =  require('web3');
const web3 =   new Web3( new Web3.providers.HttpProvider('https://rinkeby.infura.io/v3/9a16251f6a014550839f89c839e1f49e'));  
const contractABI = require('../abi/staking-abi.json')
const contractAddress = "";



export const approve = async( ) => {

    let tokenAddress = "0xb813957d2106900BF82A0b5a85C73A03824A67A6";
    
     // Use BigNumber
    let decimals = web3.toBigNumber(18);
    let amount = web3.toBigNumber(100);
    
    // Get ERC20 Token contract instance
    let contract = web3.eth.contract(contractABI).at(tokenAddress);
    // calculate ERC20 token amount
    let value = amount.times(web3.toBigNumber(1).pow(decimals));
    // call transfer function
    contract.approve("0x7B476302f55B92ebbEB3a4140c39e4371013728b", value, (error, txHash) => {
      // it returns tx hash because sending tx
      console.log(txHash);
    });
    
    
      }


export const stake = async( ) => {

let staking = "0x7B476302f55B92ebbEB3a4140c39e4371013728b";

 // Use BigNumber
let decimals = web3.toBigNumber(18);
let amount = web3.toBigNumber(100);

// Get ERC20 Token contract instance
let contract = web3.eth.contract(contractABI).at(staking);
// calculate ERC20 token amount
let value = amount.times(web3.toBigNumber(1).pow(decimals));
// call transfer function
contract.stake(toAddress, value, (error, txHash) => {
  // it returns tx hash because sending tx
  console.log(txHash);
});


  }