//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    - Singature in solidity is dynamic data type bytes with 65 characters (132 bytes but we only need 65 first),
      In dynamic data type, 32 bytes first save the size of data,
      so data is really start after 32 bytes first
    - There are 4 steps to verify a signature in solidy
    1. message to sign
    2. hash(message)
    3. sign(hash(message), private key) | this step was done out of chain (Not be done in smart contract)
    4. ecrecover(hash(message), signature) == signer
*/

contract VerifiSignature {
    /*
        if _signature is valid and the result was returned by ecrecover() == _signer
        -> return true
    */
    function verify(
        address _signer,
        string memory _message,
        bytes memory _signature
    ) external pure returns (bool) {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, _signature) == _signer;
    }

    function getMessageHash(string memory _message)
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32)
    {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            );
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _signature)
        public
        pure
        returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = _split(_signature);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function _split(bytes memory _signature)
        internal
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(_signature.length == 65, "Error: Invalid signature length");

        assembly {
            r := mload(add(_signature, 32)) // Skip 32 bytes first, r is stored in the next 32 bytes
            s := mload(add(_signature, 64))
            v := byte(0, mload(add(_signature, 96)))
        }
    }
}
