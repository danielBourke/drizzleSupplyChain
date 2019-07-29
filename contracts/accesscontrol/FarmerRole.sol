pragma solidity ^0.5.0;

import "./Roles.sol";

contract FarmerRole {
    using Roles for Roles.Role;

    event FarmerAdded(address indexed account);
    event FarmerRemoved(address indexed account);

    Roles.Role private _farmers;

    constructor () internal {
        _addFarmer(msg.sender);
    }

    modifier onlyFarmer() {
        require(isFarmer(msg.sender),  "FarmerRole: caller does not have the farmer role.");
        _;
    }

    function isFarmer(address account) public view returns (bool) {
        return _farmers.has(account);
    }

    function addFarmer(address account) public onlyFarmer {
        _addFarmer(account);
    }

    function renounceFarmer() public {
        _removeFarmer(msg.sender);
    }

    function _addFarmer(address account) internal {
        _farmers.add(account);
        emit FarmerAdded(account);
    }

    function _removeFarmer(address account) internal {
        _farmers.remove(account);
        emit FarmerRemoved(account);
    }
}
