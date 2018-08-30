// your code here

const Web3 = require('web3');
const { interface, bytecode } = require('./compile');
const HDWalletProvider = require('truffle-hdwallet-provider');

const provider =new HDWalletProvider ("story avoid zoo stand level parade arch episode glory about mind rebel", "https://rinkeby.infura.io/v3/30c7456dbe4c42d48148a82f638471bf")  // your code here
const web3 =new Web3(provider)  // your code here

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();

  console.log('Attempting to deploy from account', accounts[0]); // address of the deployer

    const result = await new web3.eth.Contract(JSON.parse(interface))
.deploy({ data: '0x' + bytecode, arguments: [100000000000000000000, 'BCCoin', 0, 'BCC' , 100]
})
.send({ from: accounts[0],gas: '1000000' })
   // your code here
  console.log('Contract deployed to', result.options.address); //address of the deployed contract
};
deploy();
