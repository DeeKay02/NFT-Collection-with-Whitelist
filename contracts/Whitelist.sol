// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    // Mapping of whitelistedAddresses, value being "true" means the address is whitelisted
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted is used to keep track of no. of addresses whitelisted
    uint8 public numAddressesWhitelisted;

    // Sets the max. no. of whitelisted addresses when the contract is deployed
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    // Function to add the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }

}