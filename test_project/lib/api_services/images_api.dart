import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<List<String>> fetchItemImages() async {
  List<String> _imageUrls = [];

  try {
    Response response =
        await http.get(Uri.parse('https://picsum.photos/v2/list'));

    if (response.statusCode == 200) {
      var jsonResult = json.decode(response.body);

      jsonResult.forEach((element) => _imageUrls.add(element['download_url']));
    }
  } catch (e) {
    print(e);
  }
  return _imageUrls;
}
