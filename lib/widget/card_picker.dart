import 'package:flutter/material.dart';

class CardPicker extends StatelessWidget {
  const CardPicker(
      {super.key,
      required this.onCurrencySelected,
      required this.selectedCurrency,
      required this.items});

  final Function(dynamic value) onCurrencySelected;
  final String selectedCurrency;
  final List<DropdownMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(5),
        menuMaxHeight: 300,
        underline: const SizedBox(width: 0),
        value: selectedCurrency,
        isExpanded: true,
        items: items,
        onChanged: onCurrencySelected,
      ),
    );
  }
}
