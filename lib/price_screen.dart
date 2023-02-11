import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/networking.dart';
import 'package:bitcoin_ticker/widgets/card_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCrypto = cryptoList.first;
  String selectedCurrency = currenciesList.first;
  double currencyValue = 0;

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

  void getCurrencyData() async {
    var data =
        await ApiService.getCurrencyData(selectedCrypto, selectedCurrency);

    if (data != null) {
      setState(() => currencyValue = data["rate"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 25),
            CardPicker(
              title: "Crypto",
              iconData: FontAwesomeIcons.bitcoinSign,
              items: createDropdownItems(cryptoList),
              selectedCurrency: selectedCrypto,
              onCurrencySelected: (value) => setState(() {
                selectedCrypto = value;
                currencyValue = 0;
              }),
            ),
            const SizedBox(height: 20),
            CardPicker(
              title: "Currency",
              iconData: FontAwesomeIcons.dollarSign,
              items: createDropdownItems(currenciesList),
              selectedCurrency: selectedCurrency,
              onCurrencySelected: (value) => setState(() {
                selectedCurrency = value;
                currencyValue = 0;
              }),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                onPressed: () => getCurrencyData(),
                child: const Text("Get Rate"),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: const Color(0xFFD5EFDD),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: Text(
                    "1 $selectedCrypto = ${currencyValue.toStringAsFixed(2)} $selectedCurrency",
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
