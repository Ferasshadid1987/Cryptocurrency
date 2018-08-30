pragma solidity ^0.4.24;import "Interface.sol";            // change this line
contract BCCoin is Interface {
uint256 constant private MAX_UINT256 = 2**256 - 1;
   // declare balances variable here
   mapping (address=> uint256) public balances;
   mapping (address => mapping (address => uint256)) public allowed;    string public name;                   //fancy name: eg Simon Bucks
   uint8 public decimals;                //How many decimals to show.
   string public symbol;                 //An identifier: eg SBX
   uint8 public tokenValue;              //token value in ethers

   address public Owner;                 //address account who deplyed the contract
   constructor (uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol, uint8 _tokenValue) public {
      Owner = msg.sender;
      // your code here
      tokenValue=_tokenValue;
      symbol=_tokenSymbol;
      decimals=_decimalUnits;
      name=_tokenName;
     balances[Owner]=_initialAmount;
   }    function transfer(address _to, uint256 _value) public  {
      // your code here
    //  owner.transfer(_to,value);
    balances[msg.sender]=balances[msg.sender]-_value;
    balances[_to]=balances[_to]+_value;
   }    function transferFrom(address _from, address _to, uint256 _value) public  {
       uint256 allowance = allowed[_from][msg.sender];
       // your code here        if (allowance < MAX_UINT256) {
           allowed[_from][msg.sender] -= _value;
           balances[_from]=balances[_from]-_value;
           balances[_to]=balances[_to]+_value;
       }
       function approve(address _spender, uint256 _value) public  {
      // your code here
      allowed[msg.sender][_spender]+=_value;
   }
   function getBalance() public view returns(uint)
   {
     return msg.sender.balance;
   }    function getTokens()  public payable
   {   balances[Owner]-=msg.value;
       balances[msg.sender]+=msg.value/tokenValue;
        }

      function getEthers(uint _value) public {
  
      balances[msg.sender]-=_value;
      balances[Owner]+=_value;
      msg.sender.transfer(_value*tokenValue);
   }
}
