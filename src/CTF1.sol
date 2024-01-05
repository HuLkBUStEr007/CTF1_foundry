//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CTF1 {
    bool public locked;
    bytes32 private password;
    event Winner(address);

    constructor(bytes32 _password) {
        locked = true;
        password = _password;
    }

    function unlock(bytes32 _password) public {
        if (password == _password) {
            locked = false;
            emit Winner(msg.sender);
        }
    }
}