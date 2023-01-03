import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                  padding: const EdgeInsets.all(64.0),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0)),
                      child: Image.asset("assets/avatars/0.png")),
                )),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 16,
                itemBuilder: (context, index) => ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset("assets/avatars/$index.png"),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
