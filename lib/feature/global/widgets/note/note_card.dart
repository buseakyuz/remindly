import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/feature/home/create_note_view.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';
import 'package:remindly/product/models/note/note.dart';
import 'package:remindly/product/providers/note/note_provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NoteProvider>().allNotes;

    return ListView.builder(
      itemCount: notes?.length ?? 0,
      itemBuilder: (context, index) {
        return _SingleNoteItem(note: notes![index]);
      },
    );
  }
}

class _SingleNoteItem extends StatelessWidget {
  final Note note;

  const _SingleNoteItem({required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: LayoutConstants.lowVerticalPadding,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CreateNoteView(note: note)),
        ),
        child: Slidable(
          key: ValueKey(note.id),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) =>
                    context.read<NoteProvider>().deleteNote(note),
                backgroundColor: context.colorScheme.error,
                foregroundColor: context.colorScheme.onError,
                icon: Icons.delete,
                label: LocaleKeys.home_delete.tr(),
                borderRadius:
                    BorderRadius.circular(LayoutConstants.defaultRadius),
              ),
            ],
          ),
          child: _NoteCardContent(note: note),
        ),
      ),
    );
  }
}

class _NoteCardContent extends StatelessWidget {
  final Note note;

  const _NoteCardContent({required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: LayoutConstants.midAllPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.noteTitle ?? "",
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          LayoutConstants.lowEmptyHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.home_reminder_date.tr(),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _formatDate(context, note.reminderDate),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          LayoutConstants.defaultEmptyHeight,
          Text(
            note.noteContent ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium,
          ),
          LayoutConstants.lowEmptyHeight,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              _formatDate(context, note.creationDate),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(BuildContext context, DateTime? date) {
    if (date == null) return "";
    return DateFormat.yMd(context.locale.toString()).format(date);
  }
}
