pragma solidity ^0.4.11;

import "zeppelin-solidity/contracts/lifecycle/Destructible.sol";
import "./BTLToken.sol";


/**
* @dev Main Bitcalve PreCAT token ERC20 contract
* Based on references from OpenZeppelin: https://github.com/OpenZeppelin/zeppelin-solidity
*/
contract CAToken is BTLToken, Destructible {

    // Metadata
    string public constant symbol = "CAT";
    string public constant name = "Consumer Activity Token";
    uint8 public constant decimals = 18;
    string public constant version = "1.0";

    // Overrided destructor
    function destroy() public onlyOwner {
        require(mintingFinished);
        super.destroy();
    }

    // Overrided destructor companion
    function destroyAndSend(address _recipient) public onlyOwner {
        require(mintingFinished);
        super.destroyAndSend(_recipient);
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        lastCaller = msg.sender;
        return super.transfer(_to, _value);
    }

    address public lastCaller;

}