import 'package:animations/animations.dart';
import 'package:coingecko_api/data/market.dart';
import 'package:cryptoapp/components/crypto_details.dart';
import 'package:cryptoapp/components/listItem.dart';
import 'package:cryptoapp/components/openContainerWrapper.dart';
import 'package:flutter/material.dart';

import '../constant/data.dart';

class MySearchDelegate extends SearchDelegate {
  final ContainerTransitionType transitionType = ContainerTransitionType.fade;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      useMaterial3: true,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: Theme.of(context).colorScheme.primaryContainer,
            surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
      inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          border: InputBorder.none,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer)),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = "";
              }
            },
            icon: const Icon(Icons.close))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Market> suggestions = markets.where((element) {
      final result = element.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final Market suggestion = suggestions[index];
        return OpenContainerWrapper(
          transitionType: transitionType,
          closedBuilder: (context, action) => ListItem(
            market: suggestion,
            toCurrencySymbol: "\$",
          ),
          onClosed: (data) => print("closed"),
          child: CryptoDetails(
            market: suggestion,
            currencyData: currencyData,
          ),
        );
      },
    );
  }

  MySearchDelegate(this.markets, this.currencyData);

  final List<Market> markets;
  final CurrencyData currencyData;
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
