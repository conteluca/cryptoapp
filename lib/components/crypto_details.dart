import 'package:coingecko_api/data/market.dart';
import 'package:cryptoapp/backend/service.dart';
import 'package:cryptoapp/constant/data.dart';
import 'package:flutter/material.dart';

class CryptoDetails extends StatefulWidget {
  const CryptoDetails(
      {Key? key, required this.market, required this.currencyData})
      : super(key: key);
  final Market market;
  final CurrencyData currencyData;

  @override
  State<CryptoDetails> createState() => _CryptoDetailsState();
}

class _CryptoDetailsState extends State<CryptoDetails> {
  late Service _service;

  @override
  void initState() {
    _service = Service(() {}, widget.currencyData.code);
    _service.getMarketChart(widget.market.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.market.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        Column(
          children: [
            CryptoHeader(
              market: widget.market, currencyData: widget.currencyData,),
          ],
        ),
      ),
    );
  }
}

class CryptoHeader extends StatelessWidget {
  const CryptoHeader(
      {Key? key, required this.market, required this.currencyData})
      : super(key: key);
  final Market market;
  final CurrencyData currencyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${market.name} Price",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${market.currentPrice} ${currencyData.symbol}",
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
              textScaleFactor: 1.8,
            ),
            Row(
              children: [
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.star_border_outlined),
                    visualDensity: VisualDensity.compact),
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.share),
                    visualDensity: VisualDensity.compact),
              ],
            ),
          ],
        ),
        Text(
          "${market.priceChange24h!.toStringAsFixed(2)} (${market
              .priceChangePercentage24h!.toStringAsFixed(2)}%)",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: market.priceChangePercentage24h! < 0
                  ? Colors.red
                  : Colors.green),
        ),
      ],
    );
  }
}
