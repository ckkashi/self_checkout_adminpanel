import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:self_checkout_adminpanel/models/history.dart';

class ApiService {
  static const String getHistoryUrl =
      'http://localhost:8000/api/historyRoute/getAllHistory';

  Future<List<History>> fetchOrders() async {
    final response = await http.get(Uri.parse('$getHistoryUrl'));

    if (response.statusCode == 200) {
      log(response.body);
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => History.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }
}
