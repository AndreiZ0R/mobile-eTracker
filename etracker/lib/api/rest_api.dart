import 'package:http/http.dart' as http;
import 'dart:convert';

class RestApi {
  static final RestApi _restApi = RestApi._internal();
  final String apiLink = 'https://ac65-109-97-98-41.eu.ngrok.io';
  final String itemsEndpoint = '/items/get';

  List<dynamic> _items = [];

  factory RestApi() {
    return _restApi;
  }

  RestApi._internal();

  //Singleton

  /*
  https://2877-109-97-98-41.eu.ngrok.io/items/create?name=spalatoare&dsc=e destul de folositoare&cat=2022-02-12&lrev=2015-06-22&interval=160&loc=Cluj Napoca
   */

  /*
  https://2877-109-97-98-41.eu.ngrok.io/items/create?name=spalatoare&dsc=e destul de folositoare&cat=2022-02-12&lrev=2015-06-22&interval=160&loc=Cluj Napoca
   */

  Future<dynamic> getItem(int id) async {
    if (_items.isNotEmpty) {
      return _items[id];
    }
    _items = await getItems();
    return _items[id];
  }

  Future<List<dynamic>> getItems() async {
    try {
      final res = await fetchItems(itemsEndpoint);
      _items = json.decode(res.body);
    } catch (err) {
      rethrow;
    }

    return _items;
  }

  Future<dynamic> getRequestedUrl(String URL) async {
    try {
      if (URL == '$apiLink$itemsEndpoint') {
        return _items.isNotEmpty ? _items : getItems();
      } else {
        final res = await fetchItemsFromURL(URL);
        return json.decode(res.body);
      }
    } catch (err) {
      print('[API ERR] ${err}');
      rethrow;
    }
  }

  Future<http.Response> fetchItems(String endpoint) {
    return http.get(Uri.parse('$apiLink$endpoint'));
  }

  Future<http.Response> fetchItemsFromURL(String URL) {
    return http.get(Uri.parse(URL));
  }

  String get allItems => '$apiLink$itemsEndpoint';
}
