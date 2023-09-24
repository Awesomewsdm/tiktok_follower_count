import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

String generateRandomRef(int refLength) {
  final random = Random();
  const allChars =
      "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789";
  final randomString = List.generate(
    refLength,
    (index) => allChars[random.nextInt(allChars.length)],
  ).join();
  return randomString;
}

String generateCodeVerifier() {
  final codeVerifier = generateRandomRef(43);
  final bytes = utf8.encode(codeVerifier);
  final digest = sha256.convert(bytes);
  final codeChallenge = base64UrlEncode(digest.bytes);
  return codeChallenge;
}

Future<String> getAccessToken(String authCode, String codeVerifier) async {
  const String clientKey = 'awiog55b91rr7em6';
  const String clientSecret = '5362dfbd81d9f35147fa421230a038ec';
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
    'code_verifier': codeVerifier,
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
