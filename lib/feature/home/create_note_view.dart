import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:provider/provider.dart';

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
  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _focusNode.requestFocus();
      _checkNote();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: _createNoteColumn(),
      ),
    );
  }

  Column _createNoteColumn() {
    return Column(
      children: [
        TextField(
          controller: titleController,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Başlık",
              hintStyle: TextStyle(fontSize: 22.0)),
        ),
        Expanded(
          child: TextField(
            controller: noteController,
            focusNode: _focusNode,
            maxLines: 10,
            style: TextStyle(fontSize: 22.0),
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Notunuzu giriniz."),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: _selectDateButton(),
          ),
        ),
      ],
    );
  }

  GestureDetector _selectDateButton() {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.event, color: Colors.white),
                Text(
                  _date != null ? formatDate() : "Tarih seçmek için dokun.",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Not oluştur",
      ),
      actions: [
        IconButton(
            onPressed: _date != null ? _saveNote : null, icon: Icon(Icons.done))
      ],
    );
  }

  void _selectDate() async {
    _date = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.tr,
      looping: false,
    );
    setState(() {});
  }

  formatDate() {
    return "${_date?.day}/${_date?.month}/${_date?.year}";
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
      var newNote = widget.note;
      newNote?.noteTitle = titleController.text;
      newNote?.noteContent = noteController.text;
      newNote?.reminderDate = _date;
      context.read<NoteProvider>().updateNote(newNote!);
      Navigator.pop(context);
    } else {
      var newNote = Note();
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
