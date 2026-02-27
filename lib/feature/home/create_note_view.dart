import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:provider/provider.dart';
import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';

import '../../product/models/note/note.dart';
import '../../product/providers/note/note_provider.dart';

class CreateNoteView extends StatefulWidget {
  final Note? note;
  const CreateNoteView({super.key, this.note});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  DateTime? _date;
  final TextEditingController noteController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      _checkNote();
    });
  }

  @override
  void dispose() {
    noteController.dispose();
    titleController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: LayoutConstants.defaultSize,
            horizontal: LayoutConstants.midSize),
        child: _createNoteColumn(context),
      ),
    );
  }

  Column _createNoteColumn(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          style: context.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: LocaleKeys.home_title_hint.tr(),
            hintStyle:
                context.textTheme.headlineSmall?.copyWith(color: Colors.grey),
          ),
        ),
        Expanded(
          child: TextField(
            controller: noteController,
            focusNode: _focusNode,
            maxLines: null,
            style: context.textTheme.bodyLarge,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: LocaleKeys.home_content_hint.tr(),
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: LayoutConstants.midVerticalPadding,
            child: _selectDateButton(context),
          ),
        ),
      ],
    );
  }

  GestureDetector _selectDateButton(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        width: double.infinity,
        height: 56.0,
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
        ),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: LayoutConstants.midSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.event, color: context.colorScheme.onPrimary),
                Text(
                  _date != null
                      ? formatDate()
                      : LocaleKeys.home_select_date.tr(),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 24)
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        LocaleKeys.home_create_note.tr(),
        style: context.textTheme.titleLarge,
      ),
      actions: [
        IconButton(
          onPressed: _date != null ? _saveNote : null,
          icon: Icon(Icons.done,
              color: _date != null ? context.colorScheme.primary : Colors.grey),
        )
      ],
    );
  }

  void _selectDate() async {
    final pickedDate = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime.now(),
      dateFormat: "dd-MMMM-yyyy",
      locale: context.locale.languageCode == 'tr'
          ? DateTimePickerLocale.tr
          : DateTimePickerLocale.en_us,
      looping: false,
    );
    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  String formatDate() {
    if (_date == null) return "";
    return DateFormat.yMd(context.locale.toString()).format(_date!);
  }

  void _checkNote() {
    if (widget.note != null) {
      titleController.text = widget.note!.noteTitle ?? "";
      noteController.text = widget.note!.noteContent ?? "";
      setState(() {
        _date = widget.note!.reminderDate;
      });
    }
  }

  void _saveNote() {
    if (widget.note != null) {
      final updatedNote = widget.note!;
      updatedNote.noteTitle = titleController.text;
      updatedNote.noteContent = noteController.text;
      updatedNote.reminderDate = _date;
      context.read<NoteProvider>().updateNote(updatedNote);
      Navigator.pop(context);
    } else {
      final newNote = Note();
      newNote.id = UniqueKey().hashCode.toString();
      newNote.noteTitle = titleController.text;
      newNote.noteContent = noteController.text;
      newNote.reminderDate = _date;
      newNote.creationDate = DateTime.now();
      context.read<NoteProvider>().addNote(newNote);
      Navigator.pop(context);
    }
  }
}
