// SPDX-License-Identifier: MIT 
// initial gas to deploy 985340 
pragma solidity ^0.8.7;

// get funds from users
// withdraw funds
// set a minimun funding value in USD
import "./PriceConvertor.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;
    //making the MINIMUM_USD constant reduced total gas to 836227 
    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address public immutable i_owner;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    constructor() {
      // making the owner immutablereduced total gas to 813127 
      i_owner = msg.sender;
    }
    modifier onlyOwner {
      if(msg.sender != i_owner){ revert NotOwner(); }
      _;
    }

    function fund() public payable{
      // want to set minimum funding value is USD 
      // the below works as the msg.value is passed as the first argument to getConversionRate()
       require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send minimum ammount");  // 1 * 10 ** 18 = 1000000000000000000 aka 1 ETH in Wei
      // revert = undo any action before and send remaing gas back
      funders.push(msg.sender);
      addressToAmountFunded[msg.sender] = msg.value;

    }

    function withdraw() public onlyOwner {
      for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
        address funder = funders[funderIndex];
        addressToAmountFunded[funder] = 0;
      }
      // reset the array
      funders = new address[](0);

      // transfer. auto reverts if failed
      // (this) referes to the contract. Cast msg.sender as payable
      // payable(msg.sender).transfer(address(this).balance);

       // send
       // this way it will revert if it fails 
       // bool sendSuccess = payable(msg.sender).send(address(this).balance);
       // require(sendSuccess, "Send Failed");

      // call. returns two variables
      (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
      require(callSuccess, "call failed");
    }
     receive() external payable {
       fund();
     }
     fallback() external payable {
       fund();
     }


}
