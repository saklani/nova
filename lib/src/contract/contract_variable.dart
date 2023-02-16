class ContractVariable<T> {
  final String name;
  final Type type;
  final String solType;

  const ContractVariable({
    required this.name,
    required this.type,
    required this.solType,
  });
}
