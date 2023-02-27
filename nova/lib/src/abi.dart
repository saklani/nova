import 'chain.dart';
import 'enums/language.dart';

/// An application binary interface (ABI).
/// The Contract Application Binary Interface (ABI) is the standard way 
/// to interact with contracts in the Ethereum ecosystem, 
/// both from outside the blockchain and for contract-to-contract interaction. 
/// Data is encoded according to its type, as described in the specification at 
/// https://docs.soliditylang.org/en/v0.8.19/abi-spec.html

class ABI {
  external factory ABI.current();

  final Chain _chain;
  final Language _language;

  const ABI(this._chain, this._language);

  @override
  String toString() => '${_language.name}@${_chain.name}';
}
