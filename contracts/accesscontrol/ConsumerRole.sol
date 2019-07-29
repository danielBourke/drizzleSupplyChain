pragma solidity ^0.5.0;

import "./Roles.sol";

contract ConsumerRole {
    using Roles for Roles.Role;

    event consumerAdded(address indexed account);
    event consumerRemoved(address indexed account);

    Roles.Role private _consumers;

    constructor () internal {
        _addConsumer(msg.sender);
    }

    modifier onlyConsumer() {
        require(isConsumer(msg.sender), "ConsumerRole: caller does not have the Consumer role");
        _;
    }

    function isConsumer(address account) public view returns (bool) {
        return _consumers.has(account);
    }

    function addConsumer(address account) public onlyConsumer {
        _addConsumer(account);
    }

    function renounceConsumer() public {
        _removeConsumer(msg.sender);
    }

    function _addConsumer(address account) internal {
        _consumers.add(account);
        emit consumerAdded(account);
    }

    function _removeConsumer(address account) internal {
        _consumers.remove(account);
        emit consumerRemoved(account);
    }
}
