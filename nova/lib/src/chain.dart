

class Chain {
  final String name;
  final String chain;
  final List<String> rpc;
  final String chainId;
  final List<String> faucets;
  final List<Currency> currencies;
  final List<Explorer> explorers;
  final String infoUrl;
  final Icon? icon;

  Chain({
    required this.name,
    required this.chain,
    required this.rpc,
    required this.chainId,
    required this.currencies,
    this.explorers = const [],
    this.faucets = const [],
    this.infoUrl = "",
    this.icon,
  });
}

class Currency {
  final String name;
  final String symbol;
  final int decimals;
  final Icon? icon;

  Currency({
    required this.name,
    required this.symbol,
    required this.decimals,
    this.icon,
  });
}

class Explorer {
  final String name;
  final String url;
  final Icon? icon;

  Explorer({
    required this.name,
    required this.url,
    this.icon,
  });
}

class Icon {
  final String url;
  final int width;
  final int height;
  final String format;

  Icon({
    required this.url,
    this.width = 32,
    this.height = 32,
    this.format = "png",
  });
}
