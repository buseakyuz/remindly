// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

enum AccountType { user, moderator, admin, superuser, developer }

enum AccountStatus { user, influencer, business }

enum UserStatus { normal, verified }

@JsonSerializable()
class UserData {
  String authId;
  String? numberId;
  List<String>? notificationIds;
  int authType;
  String emailAddress;
  String? username;
  String? realname;
  String? phoneNumber;
  String? about;
  String? avatarUrl;
  String? lastIpAddress;
  Map<String, dynamic>? socialAccounts;
  List<String>? topicList;
  int? sex;
  int followerCount;
  int followingCount;
  int chatCount;
  int notificationCount;
  int postCount;
  int postLikeCount;
  int postCommentCount;
  int questionCount;
  int questionCommentCount;
  int blogsReadCount;
  int blogsLikeCount;
  int favoriteBusinessCount;
  int businessViewCount;
  @JsonKey(toJson: _accountTypeToJson, fromJson: _accountTypeFromJson)
  AccountType accountType;
  @JsonKey(toJson: _accountStatusToJson, fromJson: _accountStatusFromJson)
  AccountStatus accountStatus;
  @JsonKey(toJson: _userStatusToJson, fromJson: _userStatusFromJson)
  UserStatus userStatus;
  int? city;
  int? country;
  double totalExpenditure;
  double coefficient;
  bool isBanned;
  bool isDeleted;
  bool isFrozen;
  bool isEmailVerified;
  bool isPhoneVerified;
  bool isAccountVerified;
  @JsonKey(fromJson: _datetimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? createDate,
      birthDate,
      banDate,
      expireBanDate,
      deleteDate,
      frozenDate,
      lastLoginDate,
      lastLogoutDate,
      usernameChangedDate,
      accountVerifiedDate;
  UserData({
    required this.authId,
    this.numberId,
    this.notificationIds,
    required this.authType,
    required this.emailAddress,
    this.username,
    this.realname,
    this.phoneNumber,
    this.about,
    this.avatarUrl,
    this.lastIpAddress,
    this.socialAccounts,
    this.topicList,
    this.sex,
    this.followerCount = 0,
    this.followingCount = 0,
    this.chatCount = 0,
    this.notificationCount = 0,
    this.postCount = 0,
    this.postLikeCount = 0,
    this.postCommentCount = 0,
    this.questionCount = 0,
    this.questionCommentCount = 0,
    this.blogsReadCount = 0,
    this.blogsLikeCount = 0,
    this.favoriteBusinessCount = 0,
    this.businessViewCount = 0,
    this.accountType = AccountType.user,
    this.accountStatus = AccountStatus.user,
    this.userStatus = UserStatus.normal,
    this.city,
    this.country,
    this.totalExpenditure = 0.0,
    this.coefficient = 0.0,
    this.isBanned = false,
    this.isDeleted = false,
    this.isFrozen = false,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.isAccountVerified = false,
    this.createDate,
    this.birthDate,
    this.banDate,
    this.expireBanDate,
    this.deleteDate,
    this.frozenDate,
    this.lastLoginDate,
    this.lastLogoutDate,
    this.usernameChangedDate,
    this.accountVerifiedDate,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

DateTime? _datetimeFromTimestamp(Timestamp? timestamp) {
  return timestamp != null
      ? DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
      : null;
}

Timestamp? _dateTimeToTimestamp(DateTime? datetime) {
  return datetime != null ? Timestamp.fromDate(datetime) : null;
}

AccountType _accountTypeFromJson(int typeCode) {
  return AccountType.values[typeCode];
}

int _accountTypeToJson(AccountType type) {
  return type.index;
}

AccountStatus _accountStatusFromJson(int typeCode) {
  return AccountStatus.values[typeCode];
}

int _accountStatusToJson(AccountStatus type) {
  return type.index;
}

UserStatus _userStatusFromJson(int typeCode) {
  return UserStatus.values[typeCode];
}

int _userStatusToJson(UserStatus type) {
  return type.index;
}
