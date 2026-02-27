import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';
import '../../../../product/lang/locale_keys.g.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorScheme.surface,
      child: ListView(
        children: [
          _DrawerHeader(),
          _DrawerItem(
            icon: Icons.notifications_active_sharp,
            title: LocaleKeys.drawer_active_reminders.tr(),
          ),
          _DrawerItem(
            icon: Icons.category,
            title: LocaleKeys.drawer_categories.tr(),
          ),
          _DrawerItem(
            icon: Icons.backup,
            title: LocaleKeys.drawer_backup.tr(),
          ),
          _DrawerItem(
            icon: Icons.settings,
            title: LocaleKeys.drawer_settings.tr(),
          ),
          _DrawerItem(
            icon: Icons.info_outline,
            title: LocaleKeys.drawer_contact_us.tr(),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(LayoutConstants.maxRadius),
      ),
      child: Center(
        child: Text(
          "Remindly",
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _DrawerItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: context.colorScheme.onSurface),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () {
        // Handle navigation
      },
    );
  }
}

// Internal LayoutConstants for this file
class LayoutConstants {
  static const maxRadius = 30.0;
}
