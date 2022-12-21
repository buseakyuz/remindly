enum DatabaseFields { users, posts, userFlows, notifications }

extension DBFieldExtension on DatabaseFields {
  String get rawValue {
    switch (this) {
      case DatabaseFields.users:
        return 'users';
      case DatabaseFields.posts:
        return 'posts';
      case DatabaseFields.userFlows:
        return 'userFlows';
      case DatabaseFields.notifications:
        return 'notifications';
    }
  }
}
