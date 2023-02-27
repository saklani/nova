
/// [ContractType]'s subtypes represent a Contract type in Solidity.
abstract class ContractType {
  const ContractType();
}

/// [_ContractInteger]'s subtypes represent a Contract integer in Solidity.
class _ContractInteger extends ContractType {
  const _ContractInteger();
}

/// [_ContractDouble]'s subtypes represent a Contract float or double in Solidity.
class _ContractDouble extends ContractType {
  const _ContractDouble();
}

/// Represents a Contract signed 8 bit integer in Solidity.
class Int8 extends _ContractInteger {
  const Int8();
}

/// Represents a Contract signed 16 bit integer in Solidity.
class Int16 extends _ContractInteger {
  const Int16();
}

/// Represents a Contract signed 32 bit integer in Solidity.
class Int32 extends _ContractInteger {
  const Int32();
}

/// Represents a Contract signed 64 bit integer in Solidity.
class Int64 extends _ContractInteger {
  const Int64();
}

/// Represents a Contract signed 128 bit integer in Solidity.
class Int128 extends _ContractInteger {
  const Int128();
}

/// Represents a Contract signed 256 bit integer in Solidity.
class Int256 extends _ContractInteger {
  const Int256();
}

/// Represents a Contract unsigned 8 bit integer in Solidity.
class Uint8 extends _ContractInteger {
  const Uint8();
}

/// Represents a Contract unsigned 16 bit integer in Solidity.
class Uint16 extends _ContractInteger {
  const Uint16();
}

/// Represents a Contract unsigned 32 bit integer in Solidity.
class Uint32 extends _ContractInteger {
  const Uint32();
}

/// Represents a Contract unsigned 64 bit integer in Solidity.
class Uint64 extends _ContractInteger {
  const Uint64();
}

/// Represents a Contract unsigned 64 bit integer in Solidity.
class Uint128 extends _ContractInteger {
  const Uint128();
}

/// Represents a Contract unsigned 64 bit integer in Solidity.
class Uint256 extends _ContractInteger {
  const Uint256();
}



/// Represents a Contract 32 bit float in C.
///
/// [Float] is not constructible in the Dart code and serves purely as marker
/// in type signatures.
class Float extends _ContractDouble {
  const Float();
}

/// Represents a Contract 64 bit double in C.
///
/// [Double] is not constructible in the Dart code and serves purely as marker
/// in type signatures.
class Double extends _ContractDouble {
  const Double();
}

/// Represents a Contract bool in C.
class Bool extends ContractType {
  const Bool();
}

/// Represents a void type in C.
abstract class Void extends ContractType {}

abstract class ContractFunction<T extends Function> extends ContractType {}