import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../config/constants.dart';
import 'custom_exceptions.dart';

class ApiProvider {
  // final Map<String, String> _headers = {
  //   'Accept': 'application/json',
  //   'Authorization': 'Bearer ${UserData().user.data?.token ?? ''}'
  // };

  Future<dynamic> getData(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.http(AppConstants.baseUrl, url, queryParameters),
        // headers: _headers,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      // print(queryParameters);
      final response = await http.post(
        Uri.http(AppConstants.baseUrl, url, queryParameters),
        // headers: _headers,
        body: formData,
      );
      responseJson = _response(response);
      // debugPrint(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body.toString());
      // print(responseJson);
      if (responseJson['status'] == 'OK') {
        return responseJson;
      } else {
        throwException(responseJson);
        // throw Exception(responseJson['message']);
      }
    } else {
      final responseJson = json.decode(response.body.toString());
      // print(responseJson);
      throwException(responseJson);
    }
  }
}

void throwException(Map<String, dynamic> data) {
  if (data.containsKey('fault')) {
    throw Exception(data['fault']['faultstring']);
  } else {
    throw Exception('Error');
  }
}
