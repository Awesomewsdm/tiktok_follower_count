class UserData {
  final String username;
  final String avatarUrl;
  final String displayName;
  final int followerCount;
  final String openId;
  final String unionId;

  UserData({
    required this.username,
    required this.avatarUrl,
    required this.displayName,
    required this.followerCount,
    required this.openId,
    required this.unionId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    final user = json['data']['user'];
    return UserData(
      username: user['username'],
      avatarUrl: user['avatar_url'],
      displayName: user['display_name'],
      followerCount: user['follower_count'],
      openId: user['open_id'],
      unionId: user['union_id'],
    );
  }
}
