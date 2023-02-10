import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/widget/card_picker.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCrypto = cryptoList.first;
  String selectedCurrency = currenciesList.first;

  List<DropdownMenuItem> createDropdownItems(List<String> list) {
    List<DropdownMenuItem> dropdownItems = [];
    for (String c in list) {
      var item = DropdownMenuItem(
        value: c,
        child: Text(c),
      );
      dropdownItems.add(item);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Icon(Icons.currency_bitcoin),
              const Text("Crypto"),
            ],
          ),
          CardPicker(
            items: createDropdownItems(cryptoList),
            selectedCurrency: selectedCrypto,
            onCurrencySelected: (value) =>
                setState(() => selectedCrypto = value),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(Icons.currency_pound),
              const Text("Currency"),
            ],
          ),
          CardPicker(
            items: createDropdownItems(currenciesList),
            selectedCurrency: selectedCurrency,
            onCurrencySelected: (value) =>
                setState(() => selectedCurrency = value),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Get Rate"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
