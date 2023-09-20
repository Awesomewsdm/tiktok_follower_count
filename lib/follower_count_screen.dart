import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:tiktok_follower_count/tiktok_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class FollowerCountScreen extends StatefulWidget {
  const FollowerCountScreen({super.key});

  @override
  State<FollowerCountScreen> createState() => _FollowerCountScreenState();
}

class _FollowerCountScreenState extends State<FollowerCountScreen> {
  TextEditingController usernameController = TextEditingController();
  String followingCount = '';
  bool isLoading = false;

  Future<void> scrapeTikTokProfile(String username) async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('https://www.tiktok.com/@$username');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final htmlContent = response.body;
        followingCount = extractFollowingCountFromHtml(htmlContent);
      } else {
        followingCount =
            'Failed to retrieve the page. Status code: ${response.statusCode}';
      }
    } catch (e) {
      followingCount = 'Error: $e';
    }

    setState(() {
      isLoading = false;
    });
  }

  String extractFollowingCountFromHtml(String htmlString) {
    try {
      final document = parse(htmlString);
      final followingCountElement = document.querySelector(
          'strong[title="Followers"][data-e2e="followers-count"]');
      return followingCountElement?.text ?? 'Not found';
    } catch (e) {
      print('Error extracting following count: $e');
      return 'Not found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TikTok Followers Count'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration:
                  const InputDecoration(labelText: 'Enter TikTok Username'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                if (username.isNotEmpty) {
                  scrapeTikTokProfile(username);
                }
              },
              child: const Text('Retrieve Followers Count'),
            ),
            const SizedBox(height: 16.0),
            const Text('Followers count'),
            isLoading
                ? const CircularProgressIndicator()
                : Text(
                    followingCount,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TiktokLoginScreen(),
                  ),
                );
              },
              child: const Text("Authorize"),
            ),
          ],
        ),
      ),
    );
  }
}
