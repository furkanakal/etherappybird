// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "/node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "/node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Staking is Ownable {

    IERC20 token;

    mapping (address => bool) hasParticipated;
    uint256 maxScore = 0;
    address maxScorer = address(0);
    
    address climateChangeDao = address(0);

    address game;

    uint256 gameStartingTime;

    constructor(address tokenAddress, address gameAddress) {
        token = IERC20(tokenAddress);
        game = gameAddress; 
    }

    modifier onlyGame {
        require(msg.sender == game, "Only game can call this function!");
        _;
    }

    function startGame() public onlyOwner {
        gameStartingTime = block.timestamp;
    }

    function stake() public {
        require(hasParticipated[msg.sender] == false, "You already participated!");
        token.transferFrom(msg.sender, address(this), 10 ** 18);
        hasParticipated[msg.sender] = true;
    }

    function updateMaxScore(address _player, uint256 _score) public onlyGame {
        if (_score > maxScore) {
            maxScore = _score;
            maxScorer = _player;
        }
    }

    function rewardMaxScorer() public onlyOwner {
        require(block.timestamp >= (gameStartingTime + 1 days), "The game hasn't finished yet.");

        token.transferFrom(address(this), climateChangeDao, token.balanceOf(address(this)) / 4);
        token.transferFrom(address(this), maxScorer, 3 * token.balanceOf(address(this)) / 4);
    }
}