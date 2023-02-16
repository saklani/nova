import 'dart:typed_data';

import '../abi/abi_impl.dart';
import '../cryptography/cryptography_impl.dart';
import '../extension.dart';
import 'enums/contract_function_type.dart';
import 'enums/state_mutability.dart';
import 'contract_variable.dart';

/// [ContractFunction] represents Solidity functions in Dart.
/// Functions can be inside or outside contracts.
/// Read more: https://docs.soliditylang.org/en/v0.8.17/contracts.html#functions
class ContractFunction {
  /// Represents the actual function name in the solidity contract
  /// In the contract below the `name` would have the value arithmetic
  /// ```solidity
  /// pragma solidity >=0.8.0 <0.9.0;
  /// contract Simple {
  ///   function arithmetic(uint a, uint b) public pure returns (uint sum, uint product) {
  ///     sum = a + b;
  ///     product = a * b;
  ///   }
  /// }
  /// ```
  final String name;

  /// The type of the function.
  /// It can be any of the 4 types:
  ///  - constructor
  ///  - fallback
  ///  - function
  ///  - receive
  final ContractFunctionType type;

  /// It is a modifier that defines how the [function] interacts with the blockchain state.
  /// It can have 4 values:
  /// - nonPayable
  /// - payable
  /// - pure
  /// - view
  final StateMutability stateMutability;

  /// The input parameters of a [function] in solidity
  ///
  final List<ContractVariable> inputs;

  /// The return variables of a [function] in solidity
  final List<ContractVariable> outputs;

  ContractFunction({
    required this.name,
    required this.type,
    required this.inputs,
    this.outputs = const [],
    this.stateMutability = StateMutability.nonPayable,
  });

  /// The selector of this function.
  /// https://solidity.readthedocs.io/en/develop/abi-spec.html#function-selector
  Uint8List get selector {
    return CryptographyImpl.keccak(ABIImpl.encodeFunctionName(this).bytes())
        .sublist(0, 4);
  }
 
  
}
