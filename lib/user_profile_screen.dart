import 'package:flutter/material.dart';
import 'package:tiktok_follower_count/fetch_data.dart';
import 'package:tiktok_follower_count/user_data_model.dart';

class UserProfileScreen extends StatelessWidget {
  final String userAuthCode;
  final String codeVerifier;
  const UserProfileScreen(
      {super.key, required this.userAuthCode, required this.codeVerifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: FutureBuilder<UserData>(
        future: fetchData(userAuthCode, codeVerifier),
        builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('User data not available'));
          } else {
            UserData userData = snapshot.data!; // Access the UserData object

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    userData.avatarUrl, // Access avatarUrl from UserData
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Username: ${userData.username}', // Access username from UserData
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Diplay Name: ${userData.displayName}', // Access username from UserData
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Follow Count: ${userData.followerCount}', // Access username from UserData
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
