class UserModel {
  UserModel(
      {required this.id,
      required this.createdAt,
      required this.username,
      required this.bio,
      required this.rank,
      required this.xp});

  String id;
  DateTime createdAt;
  String username;
  String bio;
  String rank;
  int xp;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["_id"],
      createdAt: DateTime.parse(json["createdAt"]),
      username: json["username"],
      bio: json["bio"],
      rank: json["rank"],
      xp: json["xp"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "username": username,
        "bio": bio,
        "rank": rank,
        "xp": xp
      };
}
