pragma solidity ^0.6.0;

import "../../node_modules/openzeppelin-solidity/contracts/access/Ownable.sol";
import "./Interface/ICollection_Factory.sol";
import "./collection.sol";

contract Collection_Factory is Ownable {
    mapping(address => address) public onwership;
    address[] public collections;

    /** =================== mutative function =================== */
    function create(
        string memory _name,
        string memory _symbol,
        string memory _baseurl,
        address owner
    ) external returns (address) {
        require( owner != address(0), "you must set a address");
        bytes memory bytecode = type(collection).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(_name, _symbol,_baseurl,owner));
        assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
        bytes4 selector = keccak256(abi.encode(initialize(string, string, string, address)));
        bytes payload = abi.encodeWithSelector(selector, _name, _symbol,_baseurl,owner);
        ICollection_Factory(pair).call(payload);
        onwership[owner] = pair;
        collections.push(pair);

        emit create( _name, _symbol, _baseurl, owner);
    }


    /** =================== view =================== */
    function getlength() external view returns (uint){
        return collections.length;
    }

    function getcollection(address owner) external returns (address) {
        return ownership[owner];
    }

    /** =================== event =================== */
    event create(string indexed name, string indexed symbol, string indexed baseurl, address indexed owner);

}