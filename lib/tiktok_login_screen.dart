import 'package:flutter/material.dart';
import 'package:flutter_tiktok_sdk/flutter_tiktok_sdk.dart';
import 'package:tiktok_follower_count/fetch_user_data.dart';
import 'package:tiktok_follower_count/get_access_token.dart';

class TiktokLoginScreen extends StatefulWidget {
  const TiktokLoginScreen({super.key});

  @override
  State<TiktokLoginScreen> createState() => _TiktokLoginScreenState();
}

class _TiktokLoginScreenState extends State<TiktokLoginScreen> {
  String loginResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiktok Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await TikTokSDK.instance.login(
                  permissions: {
                    TikTokPermissionType.userInfoBasic,
                    TikTokPermissionType.userInfoStats,
                  },
                );
                setState(() => loginResult = result.toString());
                print('Login result: $loginResult');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tiktok_rounded),
                  Text('Login with Tiktok'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text('Login result: $loginResult'),
            ElevatedButton(
              onPressed: () async {
                var accessToken = await getAccessToken(loginResult);
                var userData = await fetchUserData(accessToken);
              },
              child: const Text("Go to Usersname"),
            ),
          ],
        ),
      ),
    );
  }
}
