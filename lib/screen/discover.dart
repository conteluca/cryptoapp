import 'package:animations/animations.dart';
import 'package:cryptoapp/components/openContainerWrapper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../backend/service.dart';
import '../components/crypto_details.dart';
import '../components/listItem.dart';
import '../components/mySearchDelegate.dart';
import '../constant/data.dart';

class Discover extends StatefulWidget {
  const Discover({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final titleStyle = const TextStyle(fontWeight: FontWeight.bold);
  final ScrollController controller;
  final ContainerTransitionType transitionType = ContainerTransitionType.fade;

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  late Service _service;
  CurrencyData _currencyData = const CurrencyData();
  bool isLoading = false;

  @override
  void initState() {
    _service = Service(loadData, _currencyData.code);
    _service.getCoinList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: _buildHeader,
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        onRefresh: _onRefresh,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _service.market.length,
                controller: widget.controller,
                itemBuilder: (context, index) => OpenContainerWrapper(
                      transitionType: widget.transitionType,
                      closedBuilder: (context, action) => ListItem(
                        market: _service.market[index],
                        toCurrencySymbol: _currencyData.symbol,
                      ),
                      onClosed: (data) => print("closed"),
                      child: CryptoDetails(
                        market: _service.market[index],
                        currencyData: _currencyData,
                      ),
                    )),
      ),
    );
  }

  List<Widget> _buildHeader(context, innerBoxIsScrolled) => [
        SliverAppBar(
          forceElevated: innerBoxIsScrolled,
          title: const Text("Discover"),
          floating: true,
          actions: _actions(),
        )
      ];

  void loadData() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _onRefresh() async {
    return Future<void>.delayed(
        const Duration(seconds: 3), () => _service.getCoinList());
  }

  List<Widget> _actions() {
    return [
      IconButton(
        onPressed: search,
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: _showBottomModal,
        icon: const FaIcon(
          FontAwesomeIcons.ellipsisVertical,
          size: 22.0,
        ),
      ),
      const SizedBox(
        width: 8.0,
      )
    ];
  }

  void search() =>
      showSearch(context: context, delegate: MySearchDelegate(_service.market,_currencyData));

  void _showBottomModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => CurrencyItemSheet(
        onPressed: _changeCurrency,
      ),
    );
  }

  _changeCurrency(CurrencyData e) {
    setState(() {
      _currencyData = e;
    });
    _service.setCurrency(e.code);
    _service.getCoinList();
    Navigator.pop(context);
  }
}

class CurrencyItemSheet extends StatelessWidget {
  const CurrencyItemSheet({Key? key, required this.onPressed})
      : super(key: key);
  final void Function(CurrencyData e) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: kCurrencies
          .map((CurrencyData e) => TextButton.icon(
                onPressed: () => onPressed(e),
                icon: e.icon,
                label: Text(
                  e.code.toUpperCase(),
                  textScaleFactor: 1.2,
                ),
              ))
          .toList(),
    );
  }
}
