import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/market.dart';
import 'package:coingecko_api/data/market_chart_data.dart';

class Service {
  late CoinGeckoApi api;
  List<Market> market = [];
  void Function() onLoading;
  String vsCurrency;

  Service(this.onLoading, this.vsCurrency) {
    api = CoinGeckoApi();
    print("object");
  }

  void setCurrency(String newVsCurrency) {
    vsCurrency = newVsCurrency;
  }

  Future<List<Market>> getCoinList() async {
    onLoading();
    final listCoinMarkets =
        await api.coins.listCoinMarkets(vsCurrency: vsCurrency);
    onLoading();
    if (listCoinMarkets.isError) {
      return market;
    }
    market = listCoinMarkets.data;
    return market;
  }

  getMarketChart(String id) async{
    CoinGeckoResult<List<MarketChartData>> chartData =  await api.coins.getCoinMarketChart(id: id, vsCurrency: "usd");
    print(chartData.data[0].price!);
  }

}
