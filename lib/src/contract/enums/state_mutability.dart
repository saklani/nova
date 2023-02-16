/// State mutability of a [function] defines how it interacts with the blockchain.
enum StateMutability {
  /// Function whose output is independent of the blockchain state.
  pure,

  /// Function can only read blockchain state
  view,

  /// Function may write to the blockchain, but doesn't accept any payment.
  nonPayable,

  /// Function may write to the blockchain and accepts payments.
  payable,
}