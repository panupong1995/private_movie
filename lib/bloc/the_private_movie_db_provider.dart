import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:private_movie/log.dart';

class ThePrivateMovieDbProvider {
  Future<List<String>> loadData() async {
    try {
      var url = Uri.parse('https://api.avgle.com/v1/categories');
      var r = await http.get(url);
      if (r.statusCode != 200) {
        printLog('Error');
      }
      dynamic responseJson = json.decode(utf8.decoder.convert(r.bodyBytes));
      if (responseJson == null) {
        throw Exception('no categories found');
      }
      return responseJson['response']['categories'];
    } catch (e) {
      throw Exception('API access fail');
    }
  }
}