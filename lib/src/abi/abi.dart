import '../contract/contract.dart';
import 'abi_impl.dart';

class ABI {
  static Contract decode({required String address, required String abi
  }) =>
      ABIImpl.decode(address, abi);

  static String encode(Contract contract) => ABIImpl.encode(contract);
}
