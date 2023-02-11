import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static bool _isBusy = false;

  static Future getCurrencyData(String crypto, String currency) async {
    if (_isBusy) return;
    _isBusy = true;

    try {
      var uri = Uri.parse(
          "https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=B223C108-733D-41DA-9539-C5A662E7E363");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        throw response.statusCode;
      }
    } on Exception catch (ex) {
      print(ex);
    } finally {
      _isBusy = false;
    }
  }
}
