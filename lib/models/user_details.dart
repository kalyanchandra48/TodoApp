import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_details.g.dart';

@HiveType(typeId: 1)
class UserDetails {
  @HiveField(1)
  String useruid;
  @HiveField(2)
  String name;
  @HiveField(3)
  String emailid;
  @HiveField(4)
  String profileimage;
  
  UserDetails({
    required this.useruid,
    required this.name,
    required this.emailid,
    required this.profileimage,
 
  });

  UserDetails copyWith({
    String? useruid,
    String? name,
    String? emailid,
    String? profileimage,
  }) {
    return UserDetails(
      useruid: useruid ?? this.useruid,
      name: name ?? this.name,
      emailid: emailid ?? this.emailid,
      profileimage: profileimage ?? this.profileimage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'useruid': useruid});
    result.addAll({'name': name});
    result.addAll({'emailid': emailid});
    result.addAll({'profileimage': profileimage});
  
    return result;
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      useruid: map['useruid'] ?? '',
      name: map['name'] ?? '',
      emailid: map['emailid'] ?? '',
      profileimage: map['profileimage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDetails(useruid: $useruid, name: $name, emailid: $emailid, profileimage: $profileimage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserDetails &&
      other.useruid == useruid &&
      other.name == name &&
      other.emailid == emailid &&
      other.profileimage == profileimage;
  }

  @override
  int get hashCode {
    return useruid.hashCode ^
      name.hashCode ^
      emailid.hashCode ^
      profileimage.hashCode;
  }
}
