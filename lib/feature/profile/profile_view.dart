import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:remindly/product/navigation/route_enums.dart';

import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';
import 'package:remindly/product/providers/note/note_provider.dart';
import 'package:remindly/product/providers/user/user_context.dart';
import '../global/screens/avatar/select_avatar_view.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_list_tile.dart';
import 'widgets/profile_statistics_row.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final userContext = context.watch<UserContext>();
    final noteProvider = context.watch<NoteProvider>();

    final userName = userContext.userData?.realname ??
        userContext.authUser?.displayName ??
        userContext.authUser?.email?.split('@').first ??
        '';

    final noteCount = noteProvider.allNotes?.length.toString() ?? "0";
    final createdDate = userContext.userData?.createDate;
    final formattedDate = createdDate != null
        ? DateFormat("dd.MM.yyyy").format(createdDate)
        : "-";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.profile_title.tr(),
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: LayoutConstants.centralAllPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileAvatar(onEditTap: _selectAvatar),
            LayoutConstants.defaultEmptyHeight,
            Text(
              userName,
              style: context.textTheme.headlineMedium,
            ),
            LayoutConstants.centralEmptyHeight,
            ProfileStatisticsRow(noteCount: noteCount, joinDate: formattedDate),
            LayoutConstants.centralEmptyHeight,
            const Divider(indent: 12.0, endIndent: 12.0, thickness: 0.5),
            _buildActionList(context),
          ],
        ),
      ),
    );
  }

  Expanded _buildActionList(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        shrinkWrap: true,
        children: [
          ProfileListTile(
            title: LocaleKeys.profile_user_info.tr(),
            subtitle: LocaleKeys.profile_user_info_sub.tr(),
            icon: Icons.chevron_right,
            onTap: () {},
          ),
          ProfileListTile(
            title: LocaleKeys.profile_password_actions.tr(),
            subtitle: LocaleKeys.profile_password_actions_sub.tr(),
            icon: Icons.chevron_right,
            onTap: () {},
          ),
          ProfileListTile(
            title: LocaleKeys.profile_terms.tr(),
            subtitle: LocaleKeys.profile_terms_sub.tr(),
            icon: Icons.chevron_right,
            onTap: () {},
          ),
          ProfileListTile(
            title: LocaleKeys.profile_change_language.tr(),
            subtitle: LocaleKeys.profile_change_language_sub.tr(),
            icon: Icons.language,
            onTap: () => _showLanguageSelection(context),
          ),
          ProfileListTile(
            title: LocaleKeys.profile_logout.tr(),
            icon: Icons.logout,
            iconColor: context.colorScheme.error,
            textColor: context.colorScheme.error,
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  void _selectAvatar() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(44.0)),
      context: context,
      builder: (context) => SelectAvatarView(),
    );
  }

  void _showLanguageSelection(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.profile_change_language.tr(),
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                LayoutConstants.defaultEmptyHeight,
                ListTile(
                  leading: const Text("🇹🇷", style: TextStyle(fontSize: 24)),
                  title: const Text('Türkçe',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: context.locale.languageCode == 'tr'
                      ? Icon(Icons.check_circle,
                          color: context.colorScheme.primary)
                      : null,
                  onTap: () {
                    context.setLocale(const Locale('tr', 'TR'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Text("🇺🇸", style: TextStyle(fontSize: 24)),
                  title: const Text('English',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: context.locale.languageCode == 'en'
                      ? Icon(Icons.check_circle,
                          color: context.colorScheme.primary)
                      : null,
                  onTap: () {
                    context.setLocale(const Locale('en', 'US'));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(LocaleKeys.profile_logout.tr(),
              style: context.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          content: Text(LocaleKeys.profile_logout_desc.tr()),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                LocaleKeys.profile_logout_cancel.tr(),
                style: context.textTheme.bodyLarge?.copyWith(
                    color:
                        context.colorScheme.onSurface.withValues(alpha: 0.7)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.error,
              ),
              onPressed: () async {
                context.pop();
                await context.read<UserContext>().logOut();
                if (context.mounted) {
                  context.go(AppRoutes.onboard.path);
                }
              },
              child: Text(
                LocaleKeys.profile_logout_confirm.tr(),
                style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onError,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
