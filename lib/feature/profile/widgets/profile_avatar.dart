import 'package:flutter/material.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/providers/user/user_context.dart';
import 'package:provider/provider.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback onEditTap;

  const ProfileAvatar({
    super.key,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
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
            onTap: onEditTap,
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                  color: context.colorScheme.onPrimary,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
