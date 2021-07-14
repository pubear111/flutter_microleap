import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'https://api.stg.microleapasia.com/api';
}

class ApiService {
  static Future<Object> login(email, password) async {
    final body = {'email': email, 'password': password};

    final response = await http
        .post('${URLS.BASE_URL}/Users/login?include=user', body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<List<dynamic>> getNotes() async {
    final response = await http.get('${URLS.BASE_URL}/Notes');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<Object> investorApplications(body) async {
    final response = await http.post('${URLS.BASE_URL}/InvestorApplications',
        body: json.encode(body));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<Object> leaguePoints(query) async {
    final response =
        await http.get('${URLS.BASE_URL}/LeaguePoints/table?' + query);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
