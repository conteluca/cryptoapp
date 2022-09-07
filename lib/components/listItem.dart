import 'package:coingecko_api/data/market.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    this.onTap,
    required this.toCurrencySymbol,
    required this.market,
  }) : super(key: key);
  final Market market;
  final String toCurrencySymbol;
  final void Function()? onTap;
  final double trendIconSize = 12.0;
  final TextStyle textStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    var color = market.priceChangePercentage24h! < 0 ? Colors.red : Colors.green;
    var icon = market.priceChangePercentage24h! < 0
        ? FaIcon(
            FontAwesomeIcons.arrowTrendDown,
            size: trendIconSize,
            color: color,
          )
        : FaIcon(
            FontAwesomeIcons.arrowTrendUp,
            size: trendIconSize,
            color: color,
          );
    return ListTile(
      dense: true,
      onTap: onTap,
      title: Text(market.name, style: textStyle),
      subtitle: Text(market.symbol.toUpperCase()),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(market.image!),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("${market.currentPrice.toString()} $toCurrencySymbol", style: textStyle),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                market.priceChangePercentage24h.toString(),
                style: TextStyle(color: color, fontSize: 14),
              ),
              const SizedBox(
                width: 6.0,
              ),
              icon,
            ],
          ),
        ],
      ),
    );
  }
}
