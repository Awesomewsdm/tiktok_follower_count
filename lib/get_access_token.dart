import 'dart:convert';
import 'package:http/http.dart' as http;

const String clientKey = 'awiog55b91rr7em6';
const String clientSecret = '5362dfbd81d9f35147fa421230a038ec';
const String userAuthCode =
    '_tV8GOhonxAO5b1Ykl-4PICZzB9IoDImGPp6Ty1JdIaWtA2X9P1tuR8D8ZkyUU8DJBmOwSl5buJ6c-gDPS2FpHEhUV7_Bw3Rvl7ea5HZzDz2lhT0c9QrUJ2IvdHwTAPh4C2lAx6jDvhTnH07dB232g*3!5039';

Future<String> getAccessToken(String authCode) async {
  const String url = 'https://open.tiktokapis.com/v2/oauth/token/';
  final Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Cache-Control': 'no-cache',
  };
  final Map<String, String> body = {
    'client_key': clientKey,
    'client_secret': clientSecret,
    'code': authCode,
    'grant_type': 'authorization_code',
    'redirect_uri': 'https://api.sourceimpact.io/api/v1/tiktok/login/',
  };

  final http.Response response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final String accessToken = responseData['access_token'];
    return accessToken;
  } else {
    throw Exception('Failed to obtain access token');
  }
}
