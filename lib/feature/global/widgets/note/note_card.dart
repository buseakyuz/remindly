import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:remindly/feature/home/create_note_view.dart';
import 'package:remindly/product/models/note/note.dart';
import 'package:remindly/product/providers/note/note_provider.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return listView(context);
  }

  ListView listView(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<NoteProvider>().allNotes?.length,
        itemBuilder: (context, index) {
          return _singleNote(context.read<NoteProvider>().allNotes?[index]);
        });
  }

  Widget _singleNote(Note? note) {
    return GestureDetector(
      onTap: () {
        goToEditNote(note);
      },
      child: _slidable(note),
    );
  }

  Slidable _slidable(Note? note) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(motion: const ScrollMotion(),
          //dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              flex: 2,
              autoClose: true,
              onPressed: (context) {
                deleteNote(context, note!);
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ]),
      child: singleNoteColumn(note),
    );
  }

  Column singleNoteColumn(Note? note) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note?.noteTitle ?? "",
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hatırlatma Tarihi",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            Text(formatDate(note?.reminderDate),
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Text(
          note?.noteContent ?? "",
          softWrap: true,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
          maxLines: 2,
          overflow: TextOverflow.fade,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            formatDate(note?.creationDate),
            style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 16.0,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }

  formatDate(DateTime? date) {
    return "${date?.day}/${date?.month}/${date?.year}";
  }

  void goToEditNote(Note? note) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateNoteView(
          note: note,
        ),
      ),
    );
  }

  void deleteNote(BuildContext context, Note note) {
    context.read<NoteProvider>().deleteNote(note);
  }
}
