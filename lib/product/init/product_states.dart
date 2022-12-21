import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/auth/auth_provider.dart';
import '../providers/user/user_context.dart';
import 'theme_manager.dart';

class ProductProvider {
  final List<SingleChildWidget> items = [
    ChangeNotifierProvider(create: (context) => UserContext(context)),
    ChangeNotifierProvider(create: (context) => AuthProvider(context), lazy: false),
    ChangeNotifierProvider<ThemeManager>(create: (context) => ThemeManager()),
  ];
}
