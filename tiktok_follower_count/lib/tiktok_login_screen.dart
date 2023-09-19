import 'package:flutter/material.dart';
import 'package:flutter_tiktok_sdk/flutter_tiktok_sdk.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class TiktokLoginScreen extends StatefulWidget {
  const TiktokLoginScreen({super.key});

  @override
  State<TiktokLoginScreen> createState() => _TiktokLoginScreenState();
}

class _TiktokLoginScreenState extends State<TiktokLoginScreen> {
  String loginResult = '';
  Future<void> initiateTikTokAuth() async {
    try {
      final result = await FlutterWebAuth.authenticate(
        url: 'https://open-api.tiktok.com/platform/oauth/connect/',
        callbackUrlScheme: 'your_callback_scheme',
      );

      // Process the authentication result
    } catch (e) {
      // Handle any authentication errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await TikTokSDK.instance.login(
                  permissions: {
                    TikTokPermissionType.userInfoBasic,
                  },
                );
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
          ],
        ),
      ),
    );
  }
}
