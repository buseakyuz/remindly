import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindly/product/providers/user/user_context.dart';

import '../../../../core/constants/layout_constants.dart';

class SelectAvatarView extends StatefulWidget {
  const SelectAvatarView({super.key});

  @override
  State<SelectAvatarView> createState() => _SelectAvatarViewState();
}

class _SelectAvatarViewState extends State<SelectAvatarView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(44.0),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: LayoutConstants.ultraAllPadding,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0)),
                      child:
                          Image.asset(context.watch<UserContext>().avatarPath)),
                )),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 16,
                itemBuilder: (context, index) {
                  final itemPath = "assets/avatars/$index.png";
                  return GestureDetector(
                    onTap: () {
                      context.read<UserContext>().updateAvatar(itemPath);
                    },
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image.asset(itemPath),
                          )),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
