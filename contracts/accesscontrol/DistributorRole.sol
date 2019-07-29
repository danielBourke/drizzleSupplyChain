pragma solidity ^0.5.0;

import "./Roles.sol";

contract DistributorRole {
    using Roles for Roles.Role;

    event distributorAdded(address indexed account);
    event distributorRemoved(address indexed account);

    Roles.Role private _distributor;

    constructor () internal {
        _addDistributor(msg.sender);
    }

    modifier onlyDistributor() {
        require(isDistributor(msg.sender),  "DistributerRole: caller does not have the distributer role.");
        _;
    }

    function isDistributor(address account) public view returns (bool) {
        return _distributor.has(account);
    }

    function addDistributor(address account) public onlyDistributor {
        _addDistributor(account);
    }

    function renounceDistributor() public {
        _removeDistributor(msg.sender);
    }

    function _addDistributor(address account) internal {
        _distributor.add(account);
        emit distributorRemoved(account);
    }

    function _removeDistributor(address account) internal {
        _distributor.remove(account);
        emit distributorRemoved(account);
    }
}
