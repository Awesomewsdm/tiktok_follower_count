// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' show parse;

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController usernameController = TextEditingController();
//   String followingCount = '';
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();

//     usernameController.addListener(() {
//       final username = usernameController.text;
//       if (username.isNotEmpty) {
//         scrapeTikTokProfile(username);
//       }
//     });
//   }

//   Future<void> scrapeTikTokProfile(String username) async {
//     setState(() {
//       isLoading = true; 
//     });

//     try {
//       final url = Uri.parse('https://www.tiktok.com/@$username');
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final htmlContent = response.body;
//         followingCount = extractFollowingCountFromHtml(htmlContent);
//       } else {
//         followingCount =
//             'Failed to retrieve the page. Status code: ${response.statusCode}';
//       }
//     } catch (e) {
//       followingCount = 'Error: $e';
//     }

//     setState(() {
//       isLoading = false; 
//     });
//   }

//   String extractFollowingCountFromHtml(String htmlString) {
//     try {
//       final document = parse(htmlString);
//       final followingCountElement = document.querySelector(
//           'strong[title="Followers"][data-e2e="followers-count"]');
//       return followingCountElement?.text ?? 'Not found';
//     } catch (e) {
//       print('Error extracting following count: $e');
//       return 'Not found';
//     }
//   }

//   @override
//   void dispose() {
//     usernameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TikTok Followers Count'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: usernameController,
//               decoration:
//                   const InputDecoration(labelText: 'Enter TikTok Username'),
//             ),
//             const SizedBox(height: 16.0),
//             isLoading
//                 ? const CircularProgressIndicator() 
//                 : Text('Followers count: $followingCount'),
//           ],
//         ),
//       ),
//     );
//   }
// }
