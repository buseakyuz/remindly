import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  String? _notificationType;
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutConstants.midSize,
              ),
              child: _createNoteColumn(context),
            ),
          ),
          _buildBottomActionBar(context),
        ],
      ),
    );
  }

  Column _createNoteColumn(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: LocaleKeys.home_title_hint.tr(),
            hintStyle: context.textTheme.headlineSmall?.copyWith(
              color: Colors.grey,
            ),
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
      ],
    );
  }

  Widget _buildBottomActionBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.defaultSize,
            vertical: LayoutConstants.lowSize,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildToolbarButton(
                context: context,
                icon: Icons.calendar_today,
                label: _date != null ? formatDate() : "Tarih (İsteğe Bağlı)",
                isActive: _date != null,
                onTap: _selectDate,
                onLongPress: _date != null ? _clearDate : null,
              ),
              _buildToolbarButton(
                context: context,
                icon: _notificationType == 'Sessiz'
                    ? Icons.notifications_off
                    : Icons.notifications_active,
                label: _notificationType ?? "Bildirim",
                isActive: _notificationType != null,
                onTap: () => _showNotificationBottomSheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolbarButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
    VoidCallback? onLongPress,
  }) {
    final color = isActive
        ? context.colorScheme.primary
        : context.colorScheme.onSurface.withAlpha(150);

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.midSize,
          vertical: LayoutConstants.lowSize,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNotificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(LayoutConstants.largeSize),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: LayoutConstants.highVerticalPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: LayoutConstants.defaultVerticalPadding,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurface.withAlpha(50),
                    borderRadius: BorderRadius.circular(
                      LayoutConstants.defaultRadius,
                    ),
                  ),
                ),
                Text(
                  "Bildirim Tipi Seçin",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                LayoutConstants.midEmptyHeight,
                ListTile(
                  leading: const Icon(Icons.notifications_active),
                  title: const Text("Anlık Bildirim (Sesli)"),
                  onTap: () {
                    setState(() {
                      _notificationType = "Sesli";
                    });
                    context.pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_off),
                  title: const Text("Anlık Bildirim (Sessiz)"),
                  onTap: () {
                    setState(() {
                      _notificationType = "Sessiz";
                    });
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
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
          onPressed:
              (titleController.text.isNotEmpty ||
                  noteController.text.isNotEmpty)
              ? _saveNote
              : null,
          icon: Icon(
            Icons.done,
            color:
                (titleController.text.isNotEmpty ||
                    noteController.text.isNotEmpty)
                ? context.colorScheme.primary
                : Colors.grey,
          ),
        ),
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

  void _clearDate() {
    setState(() {
      _date = null;
    });
  }

  String formatDate() {
    if (_date == null) return "";
    return DateFormat.yMd(context.locale.toString()).format(_date!);
  }

  void _checkNote() {
    titleController.addListener(() => setState(() {}));
    noteController.addListener(() => setState(() {}));

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
      context.pop();
    } else {
      final newNote = Note();
      newNote.id = UniqueKey().hashCode.toString();
      newNote.noteTitle = titleController.text;
      newNote.noteContent = noteController.text;
      newNote.reminderDate = _date;
      newNote.creationDate = DateTime.now();
      context.read<NoteProvider>().addNote(newNote);
      context.pop();
    }
  }
}
