import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';
import 'package:remindly/product/providers/note/note_provider.dart';
import 'package:remindly/product/providers/user/user_context.dart';
import '../global/screens/avatar/select_avatar_view.dart';

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
        'Kullanıcı';

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
            _buildAvatarSection(context),
            LayoutConstants.lowEmptyHeight,
            Text(
              userName,
              style: context.textTheme.headlineMedium,
            ),
            const Divider(indent: 12.0, endIndent: 12.0, thickness: 0.5),
            _buildStatisticsRow(context, noteCount, formattedDate),
            const Divider(indent: 12.0, endIndent: 12.0, thickness: 0.5),
            _buildActionList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            width: 84.0,
            height: 84.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
                  AssetImage(context.watch<UserContext>().avatarPath),
            ),
          ),
          GestureDetector(
            onTap: _selectAvatar,
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.edit,
                    color: context.colorScheme.onPrimary, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsRow(
      BuildContext context, String noteCount, String joinDate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          context,
          title: noteCount,
          subtitle: LocaleKeys.profile_reminder_note.tr(),
        ),
        _buildStatItem(
          context,
          title: joinDate,
          subtitle: LocaleKeys.profile_joined_date.tr(),
        ),
      ],
    );
  }

  Widget _buildStatItem(BuildContext context,
      {required String title, required String subtitle}) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Expanded _buildActionList(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        shrinkWrap: true,
        children: [
          _ProfileListTile(
            title: LocaleKeys.profile_user_info.tr(),
            subtitle: LocaleKeys.profile_user_info_sub.tr(),
            icon: Icons.chevron_right,
            onTap: () {},
          ),
          _ProfileListTile(
            title: LocaleKeys.profile_password_actions.tr(),
            subtitle: LocaleKeys.profile_password_actions_sub.tr(),
            icon: Icons.chevron_right,
            onTap: () {},
          ),
          _ProfileListTile(
            title: LocaleKeys.profile_terms.tr(),
            subtitle: LocaleKeys.profile_terms_sub.tr(),
            icon: Icons.chevron_right,
            onTap: () {},
          ),
          _ProfileListTile(
            title: LocaleKeys.profile_change_language.tr(),
            subtitle: LocaleKeys.profile_change_language_sub.tr(),
            icon: Icons.language,
            onTap: () => _showLanguageSelection(context),
          ),
          _ProfileListTile(
            title: LocaleKeys.profile_logout.tr(),
            icon: Icons.logout,
            iconColor: context.colorScheme.error,
            textColor: context.colorScheme.error,
            onTap: () {},
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
}

class _ProfileListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback onTap;

  const _ProfileListTile({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: textColor ?? context.colorScheme.onSurface,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle ?? "",
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            )
          : null,
      trailing: Icon(
        icon,
        color: iconColor ?? context.colorScheme.onSurface,
      ),
    );
  }
}
