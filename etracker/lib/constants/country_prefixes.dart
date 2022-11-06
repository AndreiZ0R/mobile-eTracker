import 'dart:convert';

import 'package:flutter/services.dart';

class CountriesHelper {
  //

  static Future<String> getCountryById(int id) async {
    final String res = await rootBundle.loadString('./countries.json');
    final data = await json.decode(res);
    List items = data['countries'];

    for (var i = 0; i < items.length; i++) {
      if (items[i]['code'] == '+$id') {
        return items[i]['name'];
      }
    }

    return '';
  }
}
