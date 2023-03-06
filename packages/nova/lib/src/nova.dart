import 'account/account.dart';
import 'client/nova_client.dart';

class Nova {
  final String rpc;
  final String privateKey;

  late final NovaClient client;

  late final Account account;

  /// Nova can be used to connect to any RPC, and sign transactions using 
  /// your private key.
  Nova({required this.rpc, required this.privateKey}) {
    client = NovaClient(rpc);
    account = Account.fromClient(privateKey: privateKey, client: client);
  }
}
