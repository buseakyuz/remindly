import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/constants/asset_constants.dart';
import 'package:remindly/product/providers/note/note_provider.dart';

import '../profile/profile_view.dart';
import 'create_note_view.dart';
import 'widgets/home_drawer.dart';
import 'widgets/note_list_view.dart';
import 'widgets/total_note_counter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoteProvider>().fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomeAppBar(),
      drawer: const HomeDrawer(),
      body: const Column(
        children: [
          TotalNoteCounter(),
          Expanded(
            child: NoteListView(),
          ),
        ],
      ),
      floatingActionButton: const _HomeFab(),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.primary,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfileView()),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(AssetConstants.defaultAvatar),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeFab extends StatelessWidget {
  const _HomeFab();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.colorScheme.primary,
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CreateNoteView(),
          fullscreenDialog: true,
        ),
      ),
      child: Icon(
        Icons.add_circle_rounded,
        color: context.colorScheme.onPrimary,
      ),
    );
  }
}
