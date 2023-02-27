import 'dart:convert';
import 'dart:typed_data';

import 'package:nova/nova.dart';

import '../contract/contract_error.dart';
import '../contract/contract_event.dart';
import '../contract/contract_function.dart';
import '../contract/contract_variable.dart';
import '../contract/enums/contract_function_type.dart';
import '../contract/enums/state_mutability.dart';

class ABIImpl {
  static Contract decode(String address, String abi) {
    final List<Map<String, String>> decoded = jsonDecode(abi);
    final List<ContractFunction> functions = [];
    final List<ContractEvent> events = [];
    final List<ContractError> errors = [];

    for (final e in decoded) {
      final type = e['type'];
      switch (type) {
        case 'function':
          functions.add(decodeFunction(e));
          break;
        case 'constructor':
        case 'receive':
        case 'fallback':
          break;
        case 'event':
          events.add(decodeEvent(e));
          break;
        case 'error':
          errors.add(decodeError(e));
          break;
        default:
          throw Exception("typeNotSupported: ABI has a unsupported type");
      }
    }
    return Contract(
      address: address,
      functions: functions,
      events: events,
      errors: errors,
    );
  }

  static Type decodeDartTypeFromSolType(String name) {
    if (name.startsWith('int') || name.startsWith('uint')) {
      return BigInt;
    } else if (name == 'bool') {
      return bool;
    } else if (name == 'string') {
      return String;
    } else if (name.startsWith('bytes') ||
        name == 'address' ||
        name == 'function') {
      return Uint8List;
    } else {
      throw UnimplementedError("data type not supported");
    }
  }

  static ContractError decodeError(Map<String, String> errorData) {
    return ContractError();
  }

  static ContractEvent decodeEvent(Map<String, String> eventData) {
    return ContractEvent();
  }

  static ContractFunction decodeFunction(Map<String, dynamic> functionData) {
    List<ContractVariable> inputs = [];
    List<ContractVariable> outputs = [];
    ContractFunctionType functionType = ContractFunctionType.function;
    StateMutability stateMutability = StateMutability.nonPayable;

    return ContractFunction(
      name: functionData['name'] ?? "",
      type: functionType,
      inputs: inputs,
      outputs: outputs,
      stateMutability: stateMutability,
    );
  }

  static ContractVariable decodeVariable(Map<String, dynamic> variableData) {
    return ContractVariable(
      name: variableData["name"] ?? "",
      type: decodeDartTypeFromSolType(variableData["type"]),
      solType: variableData["type"],
    );
  }

  static String encode(Contract contract) {
    throw UnimplementedError();
  }

  /// Encode a [ContractFunction]
  static String encodeFunctionName(ContractFunction f) {
    return "";
  }

  /// Encode a [ContractVariable]
  static String encodeVariables(ContractVariable v) {
    return "";
  }
}
