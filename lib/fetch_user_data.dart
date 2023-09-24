import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchUserData(String accessToken) async {
  const String url =
      'https://open.tiktokapis.com/v2/user/info/?fields=open_id,union_id,avatar_url,display_name,username,follower_count';
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
