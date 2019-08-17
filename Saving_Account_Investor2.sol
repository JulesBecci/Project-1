pragma solidity >=0.4.0 <0.9.99;
import "browser/SafeMath.sol";


contract Investor2 {
using SafeMath for uint256;

address payable public beneficiary;

uint256 public releaseTime;

modifier OnlyInvestor2 {
require ( msg.sender ==  /*adress example*/ );
_;
}


constructor ( address payable _beneficiary, uint256 _releaseTime ) public payable {
require ( _releaseTime > now );
require ( _releaseTime > block.timestamp );
beneficiary = _beneficiary;
releaseTime = _releaseTime;
}

function getBalance() public view returns ( uint ) {
return address ( this ).balance;
}

function release() external OnlyInvestor2 {
require ( block.timestamp >= releaseTime );
address ( beneficiary ).transfer ( address ( this ).balance );
}

function () external payable {

}
}
