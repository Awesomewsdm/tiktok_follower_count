import 'package:flutter/material.dart';
import 'package:flutter_tiktok_sdk/flutter_tiktok_sdk.dart';
import 'package:tiktok_follower_count/get_access_token.dart';
import 'package:tiktok_follower_count/user_profile_screen.dart';
import 'package:tiktok_follower_count/user_data_model.dart';

class TiktokLoginScreen extends StatefulWidget {
  const TiktokLoginScreen({super.key});

  @override
  State<TiktokLoginScreen> createState() => _TiktokLoginScreenState();
}

class _TiktokLoginScreenState extends State<TiktokLoginScreen> {
  String userAuthCode = '';
  UserData? userData;
  bool isLoading = false;
  String username = "";
  String codeVerifier = "";

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
                // codeVerifier = generateCodeVerifier();
                // print(codeVerifier);
                setState(
                  () => userAuthCode = result.authCode.toString(),
                );
                // print('Login result: $userAuthCode');
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
            // Text('Login result: $userAuthCode'),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserProfileScreen(
                            userAuthCode: userAuthCode,
                            codeVerifier: codeVerifier,
                          ))),
              child: const Text("Go to Profile"),
            ),
            // Text('code verifier result: $codeVerifier'),
          ],
        ),
      ),
    );
  }
}
