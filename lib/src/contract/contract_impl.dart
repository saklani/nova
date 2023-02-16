import 'contract_error.dart';
import 'contract_event.dart';
import 'contract_function.dart';

/// Base class the implements the functions of [Contract] and interacts with the smart contracts
class ContractImpl {
  late final List<ContractFunction> functions;
  late final List<ContractEvent> events;
  late final List<ContractError> errors;

  ContractImpl({required String address, required String abiData}) {
    address = address;
  }

  
}
