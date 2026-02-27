import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/layout_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../../product/constants/asset_constants.dart';
import '../../../../product/lang/locale_keys.g.dart';
import '../../../../product/providers/note/note_provider.dart';
import '../../global/widgets/note/note_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NoteProvider>().allNotes;

    return Padding(
      padding: LayoutConstants.highAllPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.home_notes_title.tr(),
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(color: Colors.black12),
          if (notes case null || [])
            _EmptyNotesView()
          else
            const Expanded(child: NoteCard()),
        ],
      ),
    );
  }
}

class _EmptyNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.asset(
          AssetConstants.blankNote,
          height: 300,
        ),
        LayoutConstants.largeEmptyHeight,
        Text(
          LocaleKeys.home_no_notes.tr(),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
