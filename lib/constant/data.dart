import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Set<CurrencyData> kCurrencies = {
  CurrencyData("United States Dollar","usd","\$",FaIcon(FontAwesomeIcons.dollarSign),),
  CurrencyData("United Kingdom Pound","gbp","£",FaIcon(FontAwesomeIcons.sterlingSign),),
  CurrencyData("Euro Member Countries","eur","€",FaIcon(FontAwesomeIcons.euroSign),),
  CurrencyData("Hong Kong Dollar","hkd","\$",FaIcon(FontAwesomeIcons.dongSign),),
  CurrencyData("Japan Yen","jpy","¥",FaIcon(FontAwesomeIcons.yenSign),),
};

class CurrencyData{
  final String country,code,symbol;
  final FaIcon icon;

  const CurrencyData(this.country, this.code, this.symbol, this.icon);
}