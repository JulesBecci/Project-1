pragma solidity ^0.5.1;
import "./SafeMath.sol";


contract Investor1{
  
  
  using SafeMath for uint256;
  address payable public beneficiary;
  uint256 public releaseTime;
  
  
  function () external payable {
  }
  
  modifier OnlyInvestor1 { require (msg.sender == 0xCae0f3170BD28A73E79752b26f787fBd09f157ef /*adress example*/);
  _;
  }
  
  function getBalance()  public view returns (uint) {
    return address(this).balance;
  }
    
  constructor( address payable _beneficiary, uint256 _releaseTime)
    public
    payable
  {
      
  require(_releaseTime > block.timestamp);
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;
  }

  function release() public {
    require(block.timestamp >= releaseTime);
    address(beneficiary).transfer(address(this).balance);
  }
  
}