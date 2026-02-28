// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  authId: json['authId'] as String,
  numberId: json['numberId'] as String?,
  notificationIds: (json['notificationIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  authType: (json['authType'] as num).toInt(),
  emailAddress: json['emailAddress'] as String,
  username: json['username'] as String?,
  realname: json['realname'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  about: json['about'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  lastIpAddress: json['lastIpAddress'] as String?,
  socialAccounts: json['socialAccounts'] as Map<String, dynamic>?,
  topicList: (json['topicList'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  sex: (json['sex'] as num?)?.toInt(),
  followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
  followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
  chatCount: (json['chatCount'] as num?)?.toInt() ?? 0,
  notificationCount: (json['notificationCount'] as num?)?.toInt() ?? 0,
  postCount: (json['postCount'] as num?)?.toInt() ?? 0,
  postLikeCount: (json['postLikeCount'] as num?)?.toInt() ?? 0,
  postCommentCount: (json['postCommentCount'] as num?)?.toInt() ?? 0,
  questionCount: (json['questionCount'] as num?)?.toInt() ?? 0,
  questionCommentCount: (json['questionCommentCount'] as num?)?.toInt() ?? 0,
  blogsReadCount: (json['blogsReadCount'] as num?)?.toInt() ?? 0,
  blogsLikeCount: (json['blogsLikeCount'] as num?)?.toInt() ?? 0,
  favoriteBusinessCount: (json['favoriteBusinessCount'] as num?)?.toInt() ?? 0,
  businessViewCount: (json['businessViewCount'] as num?)?.toInt() ?? 0,
  accountType: json['accountType'] == null
      ? AccountType.user
      : _accountTypeFromJson((json['accountType'] as num).toInt()),
  accountStatus: json['accountStatus'] == null
      ? AccountStatus.user
      : _accountStatusFromJson((json['accountStatus'] as num).toInt()),
  userStatus: json['userStatus'] == null
      ? UserStatus.normal
      : _userStatusFromJson((json['userStatus'] as num).toInt()),
  city: (json['city'] as num?)?.toInt(),
  country: (json['country'] as num?)?.toInt(),
  totalExpenditure: (json['totalExpenditure'] as num?)?.toDouble() ?? 0.0,
  coefficient: (json['coefficient'] as num?)?.toDouble() ?? 0.0,
  isBanned: json['isBanned'] as bool? ?? false,
  isDeleted: json['isDeleted'] as bool? ?? false,
  isFrozen: json['isFrozen'] as bool? ?? false,
  isEmailVerified: json['isEmailVerified'] as bool? ?? false,
  isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
  isAccountVerified: json['isAccountVerified'] as bool? ?? false,
  createDate: _datetimeFromTimestamp(json['createDate'] as Timestamp?),
  birthDate: _datetimeFromTimestamp(json['birthDate'] as Timestamp?),
  banDate: _datetimeFromTimestamp(json['banDate'] as Timestamp?),
  expireBanDate: _datetimeFromTimestamp(json['expireBanDate'] as Timestamp?),
  deleteDate: _datetimeFromTimestamp(json['deleteDate'] as Timestamp?),
  frozenDate: _datetimeFromTimestamp(json['frozenDate'] as Timestamp?),
  lastLoginDate: _datetimeFromTimestamp(json['lastLoginDate'] as Timestamp?),
  lastLogoutDate: _datetimeFromTimestamp(json['lastLogoutDate'] as Timestamp?),
  usernameChangedDate: _datetimeFromTimestamp(
    json['usernameChangedDate'] as Timestamp?,
  ),
  accountVerifiedDate: _datetimeFromTimestamp(
    json['accountVerifiedDate'] as Timestamp?,
  ),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'authId': instance.authId,
  'numberId': instance.numberId,
  'notificationIds': instance.notificationIds,
  'authType': instance.authType,
  'emailAddress': instance.emailAddress,
  'username': instance.username,
  'realname': instance.realname,
  'phoneNumber': instance.phoneNumber,
  'about': instance.about,
  'avatarUrl': instance.avatarUrl,
  'lastIpAddress': instance.lastIpAddress,
  'socialAccounts': instance.socialAccounts,
  'topicList': instance.topicList,
  'sex': instance.sex,
  'followerCount': instance.followerCount,
  'followingCount': instance.followingCount,
  'chatCount': instance.chatCount,
  'notificationCount': instance.notificationCount,
  'postCount': instance.postCount,
  'postLikeCount': instance.postLikeCount,
  'postCommentCount': instance.postCommentCount,
  'questionCount': instance.questionCount,
  'questionCommentCount': instance.questionCommentCount,
  'blogsReadCount': instance.blogsReadCount,
  'blogsLikeCount': instance.blogsLikeCount,
  'favoriteBusinessCount': instance.favoriteBusinessCount,
  'businessViewCount': instance.businessViewCount,
  'accountType': _accountTypeToJson(instance.accountType),
  'accountStatus': _accountStatusToJson(instance.accountStatus),
  'userStatus': _userStatusToJson(instance.userStatus),
  'city': instance.city,
  'country': instance.country,
  'totalExpenditure': instance.totalExpenditure,
  'coefficient': instance.coefficient,
  'isBanned': instance.isBanned,
  'isDeleted': instance.isDeleted,
  'isFrozen': instance.isFrozen,
  'isEmailVerified': instance.isEmailVerified,
  'isPhoneVerified': instance.isPhoneVerified,
  'isAccountVerified': instance.isAccountVerified,
  'createDate': _dateTimeToTimestamp(instance.createDate),
  'birthDate': _dateTimeToTimestamp(instance.birthDate),
  'banDate': _dateTimeToTimestamp(instance.banDate),
  'expireBanDate': _dateTimeToTimestamp(instance.expireBanDate),
  'deleteDate': _dateTimeToTimestamp(instance.deleteDate),
  'frozenDate': _dateTimeToTimestamp(instance.frozenDate),
  'lastLoginDate': _dateTimeToTimestamp(instance.lastLoginDate),
  'lastLogoutDate': _dateTimeToTimestamp(instance.lastLogoutDate),
  'usernameChangedDate': _dateTimeToTimestamp(instance.usernameChangedDate),
  'accountVerifiedDate': _dateTimeToTimestamp(instance.accountVerifiedDate),
};
