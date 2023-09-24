import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchUserData(String accessToken) async {
  const String url =
      'https://open.tiktokapis.com/v2/user/info/?fields=open_id%2Cunion_id%2Cavatar_url%2Cdisplay_name%2Cusername%2Cfollower_count';

  final Map<String, String> headers = {
    'Authorization': 'Bearer $accessToken',
  };

  final http.Response response = await http.get(
    Uri.parse(url),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData;
  } else {
    throw Exception('Failed to fetch user data');
  }
}
