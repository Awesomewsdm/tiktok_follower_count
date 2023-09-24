import 'package:tiktok_follower_count/fetch_user_data.dart';
import 'package:tiktok_follower_count/get_access_token.dart';
import 'package:tiktok_follower_count/user_data_model.dart';

Future<UserData> fetchData(String userAuthCode, String codeVerifier) async {
  try {
    final String accessToken = await getAccessToken(userAuthCode, codeVerifier);
    final Map<String, dynamic> responseData = await fetchUserData(accessToken);

    UserData user = UserData.fromJson(responseData);
    return user;
  } catch (e) {
    rethrow;
  }
}
