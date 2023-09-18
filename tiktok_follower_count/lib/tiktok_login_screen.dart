import 'package:flutter/material.dart';
import 'package:flutter_tiktok_sdk/flutter_tiktok_sdk.dart';

class TiktokLoginScreen extends StatefulWidget {
  const TiktokLoginScreen({super.key});

  @override
  State<TiktokLoginScreen> createState() => _TiktokLoginScreenState();
}

class _TiktokLoginScreenState extends State<TiktokLoginScreen> {
   String loginResult = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
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
                    },
                  );
                  setState(() => loginResult = result.toString());
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              Text('Login result: $loginResult'),
            ],
          ),
        ),
      );
    
  }
}
