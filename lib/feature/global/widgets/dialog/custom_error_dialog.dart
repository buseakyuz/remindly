import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/layout_constants.dart';
import '../../../../product/lang/locale_keys.g.dart';

class CustomErrorDialog {
  final BuildContext context;

  CustomErrorDialog(this.context);

  void show({required String title, required String description}) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: Padding(
                padding: LayoutConstants.maxHorizontalPadding,
                child: Card(
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: LayoutConstants.defaultButtonBorder,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LayoutConstants.midEmptyHeight,
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      LayoutConstants.defaultEmptyHeight,
                      Padding(
                        padding: LayoutConstants.midHorizontalPadding,
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      LayoutConstants.defaultEmptyHeight,
                      const Padding(
                        padding: LayoutConstants.defaultHorizontalPadding,
                        child: Divider(
                          height: 0.5,
                          thickness: 0.5,
                        ),
                      ),
                      InkWell(
                        borderRadius:
                            const BorderRadius.vertical(bottom: Radius.circular(LayoutConstants.defaultRadius)),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            LayoutConstants.midEmptyHeight,
                            Center(
                              child: Text(
                                LocaleKeys.okey.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            LayoutConstants.midEmptyHeight,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
