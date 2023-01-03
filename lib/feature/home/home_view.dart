import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:remindly/feature/global/screens/avatar/select_avatar_view.dart';
import 'package:remindly/feature/global/widgets/note/note_card.dart';
import 'package:remindly/feature/home/create_note_view.dart';
import 'package:remindly/feature/settings/settings_view.dart';
import 'package:remindly/product/providers/note/note_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          totalNoteCounter(),
          Expanded(
            child: noteList(context),
          ),
        ],
      ),
      floatingActionButton: fabButton(context),
    );
  }

  FloatingActionButton fabButton(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateNoteView(),
              fullscreenDialog: true,
            ),
          );
        },
        child: Icon(
          Icons.add_circle_rounded,
          color: Colors.white,
        ));
  }

  Padding noteList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notlarınız;",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            context.watch<NoteProvider>().allNotes == null ||
                    context.watch<NoteProvider>().allNotes!.isEmpty
                ? Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.asset(
                        "assets/images/blanknote.png",
                      ),
                      Text(
                        "Henüz notunuz yok.",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                : Expanded(child: NoteCard()),
          ]),
    );
  }

  Container totalNoteCounter() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(44.0)),
        color: Colors.black,
      ),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 170.0,
                  child: OverflowBox(
                    minHeight: 230.0,
                    maxHeight: 230.0,
                    child: Lottie.asset(
                      "assets/lotties/white_world.json",
                    ),
                  ),
                ),
                Text(
                  "888 kişi hatırlatma notunu bıraktı.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 32.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsView()));
            },
            icon: Icon(
              Icons.dehaze,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: _selectAvatar,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/avatars/0.png"),
                //child: Image.asset("assets/avatars/0.png"),
              ),
            ),
          )
        ]);
  }

  void _selectAvatar() {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(44.0)),
        context: context,
        builder: (context) => SelectAvatarView());
  }
}
