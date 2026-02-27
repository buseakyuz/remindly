import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/layout_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../../product/constants/asset_constants.dart';
import '../../../../product/lang/locale_keys.g.dart';
import '../../../../product/providers/note/note_provider.dart';

class TotalNoteCounter extends StatelessWidget {
  const TotalNoteCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final noteCount = context.watch<NoteProvider>().allNotes?.length ?? 0;

    return Container(
      height: context.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(LayoutConstants.maxSize)),
        color: context.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Lottie.asset(
                AssetConstants.whiteWorldLottie,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstants.largeSize),
                child: Text(
                  LocaleKeys.home_total_notes_count
                      .tr(args: [noteCount.toString()]),
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            LayoutConstants.defaultEmptyHeight,
          ],
        ),
      ),
    );
  }
}
