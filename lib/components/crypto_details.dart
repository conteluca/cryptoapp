import 'package:coingecko_api/data/market.dart';
import 'package:cryptoapp/backend/service.dart';
import 'package:flutter/material.dart';


class CryptoDetails extends StatefulWidget {
  const CryptoDetails({Key? key, required this.market}) : super(key: key);
  final Market market;

  @override
  State<CryptoDetails> createState() => _CryptoDetailsState();
}

class _CryptoDetailsState extends State<CryptoDetails> {
  late Service _service;
  @override
  void initState() {
    _service = Service(() { }, "usd");
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.market.name} Price",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.market.currentPrice} \$",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 2.0,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                ],
              ),
            ),
            Text(
              "${widget.market.priceChange24h!.toStringAsFixed(2)} (${widget.market.priceChangePercentage24h!.toStringAsFixed(2)}%)",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.market.priceChangePercentage24h! < 0
                      ? Colors.red
                      : Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
