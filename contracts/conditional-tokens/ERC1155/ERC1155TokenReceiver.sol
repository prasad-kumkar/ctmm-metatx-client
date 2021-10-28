pragma solidity ^0.5.0;

import "./IERC1155TokenReceiver.sol";
import "./ERC165.sol";

import { EIP712MetaTransaction } from '../../metatx/EIP712MetaTransaction.sol';


contract ERC1155TokenReceiver is EIP712MetaTransaction, ERC165, IERC1155TokenReceiver {
    constructor() public {
        _registerInterface(
            ERC1155TokenReceiver(0).onERC1155Received.selector ^
            ERC1155TokenReceiver(0).onERC1155BatchReceived.selector
        );
    }
}
