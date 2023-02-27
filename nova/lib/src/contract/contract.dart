import '../abi.dart';
import 'contract_event.dart';
import 'contract_error.dart';
import 'contract_function.dart';

/// A contract is a collection of code (its functions) and data (its state)
/// that resides at a specific address on a blockchain.
///
/// Contract Application Binary Interface (ABI) is the standard way to
/// interact with contracts.
///
/// [Contract] represents a Solidity Contract in Dart
class Contract {
  final String address;
  final List<ContractFunction> functions;
  final List<ContractEvent> events;
  final List<ContractError> errors;


  /// Represent a Solidity [contract]
  Contract({
    required this.address,
    required this.functions,
    required this.events,
    required this.errors,
  });

  /// Decode a Solidity [contract] from the ABI.
  /// 
  factory Contract.fromABI({
    required String address,
    required String abi,
  }) =>
      ABI.decode(address: address, abi: abi);

  dynamic call({required String name, required List<dynamic> inputs}) {
    return null;
  }
}
