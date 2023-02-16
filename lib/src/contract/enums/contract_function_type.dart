enum ContractFunctionType {
  /// A standard solidity function
  function,

  /// A contract can have at most one receive function, declared using
  /// receive() external payable { ... } (without the function keyword).
  /// This function cannot have arguments, cannot return anything and must have external visibility
  /// and payable state mutability.
  /// It can be virtual, can override and can have modifiers.
  /// https://docs.soliditylang.org/en/v0.8.17/contracts.html#receive-ether-function
  recieve,

  /// Initializes a smart contract
  constructor,

  ///
  fallback,
}
