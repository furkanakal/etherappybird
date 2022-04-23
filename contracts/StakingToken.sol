// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StakingToken is ERC20 {
    constructor() ERC20("FlappyBird Token", "FBT") {
        _mint(msg.sender, 10000000000000000000);
    }
}