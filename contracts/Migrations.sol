pragma solidity ^0.5.1;

// HACK: should be removed along with the hack-ey migration
// when https://github.com/trufflesuite/truffle/pull/1085 hits
import "canonical-weth/contracts/WETH9.sol";

import "./metatx/EIP712MetaTransaction.sol";

contract Migrations is EIP712MetaTransaction {
    address public owner;
    uint public lastCompletedMigration;

    modifier restricted() {
        if (msgSender() == owner) _;
    }

    constructor() public {
        owner = msgSender();
    }

    function setCompleted(uint completed) public restricted {
        lastCompletedMigration = completed;
    }

    function upgrade(address newAddress) public restricted {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(lastCompletedMigration);
    }
}
