import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TikTok Login Kit'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            // var code = await TiktokLoginFlutter.authorize(
            // //     "user.info.basic,video.list,video.upload");
            // debugPrint(code);
          },
          child: const Text("Authorize"),
        ),
      ),
    );
  }
}
