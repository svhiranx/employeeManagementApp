import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://dummy.restapiexample.com/api/v1';

  Future<Map<String, dynamic>> getEmployees() async {
    final url = '$baseUrl/employees';
    final response = await http.get(Uri.parse(url));

    return _handleResponse(response, 'data');
  }

  Future<Map<String, dynamic>> createEmployee(Map<String, dynamic> data) async {
    final url = '$baseUrl/create';
    final response = await http.post(Uri.parse(url), body: data);
    return _handleResponse(response, 'data');
  }

  Future<Map<String, dynamic>> updateEmployee(
      String id, Map<String, dynamic> data) async {
    final url = '$baseUrl/update/$id';
    final response = await http.put(Uri.parse(url), body: data);
    return _handleResponse(response, 'data');
  }

  Future<Map<String, dynamic>> deleteEmployee(int id) async {
    final url = '$baseUrl/delete/$id';
    final response = await http.delete(Uri.parse(url));
    return _handleResponse(response, 'message');
  }

  Map<String, dynamic> _handleResponse(http.Response response, String key) {
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      return {
        'success': true,
        'data': (jsonDecode(responseBody) as Map<String, dynamic>)[key],
      };
    } else {
      String error = responseBody;
      if (response.statusCode == 429) {
        error = 'Too many requests, please try again later';
      }
      return {
        'success': false,
        'error': 'Error occurred: $error',
      };
    }
  }
}
