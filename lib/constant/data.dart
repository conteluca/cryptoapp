import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Set<CurrencyData> kCurrencies = {
  CurrencyData(
    country: "United States Dollar",
    code: "usd",
    symbol: "\$",
    icon: FaIcon(FontAwesomeIcons.dollarSign),
  ),
  CurrencyData(
    country: "United Kingdom Pound",
    code: "gbp",
    symbol: "£",
    icon: FaIcon(FontAwesomeIcons.sterlingSign),
  ),
  CurrencyData(
    country: "Euro Member Countries",
    code: "eur",
    symbol: "€",
    icon: FaIcon(FontAwesomeIcons.euroSign),
  ),
  CurrencyData(
    country: "Hong Kong Dollar",
    code: "hkd",
    symbol: "\$",
    icon: FaIcon(FontAwesomeIcons.dongSign),
  ),
  CurrencyData(
    country: "Japan Yen",
    code: "jpy",
    symbol: "¥",
    icon: FaIcon(FontAwesomeIcons.yenSign),
  ),
};

class CurrencyData {
  final String country, code, symbol;
  final FaIcon icon;

  const CurrencyData({
    this.country = "United States Dollar",
    this.code = "usd",
    this.symbol = "\$",
    this.icon = const FaIcon(FontAwesomeIcons.dollarSign),
  });
}
