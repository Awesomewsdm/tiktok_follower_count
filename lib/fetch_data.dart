import 'package:tiktok_follower_count/fetch_user_data.dart';
import 'package:tiktok_follower_count/get_access_token.dart';
import 'package:tiktok_follower_count/user_data_model.dart';

Future<UserData> fetchData() async {
  try {
    // final String accessToken = await getAccessToken(userAuthCode);
    final Map<String, dynamic> responseData = await fetchUserData(
        "act.Ozr8gECpMt1x6ALgWiv6crldAPFhNyYbMWL779JZcT6ESn7t7GvgGEmCZhom!4976");

    UserData user = UserData.fromJson(responseData);
    return user;
  } catch (e) {
    rethrow;
  }
}
