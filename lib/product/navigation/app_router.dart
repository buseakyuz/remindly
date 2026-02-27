import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remindly/feature/home/create_note_view.dart';
import 'package:remindly/feature/home/home_view.dart';
import 'package:remindly/feature/login/onboard_view.dart';
import 'package:remindly/feature/login/sign_in_view.dart';
import 'package:remindly/feature/login/sign_up_view.dart';
import 'package:remindly/feature/profile/profile_view.dart';
import 'package:remindly/product/models/note/note.dart';
import 'package:remindly/product/navigation/route_enums.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home.path,
    routes: [
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.profile.path,
        name: AppRoutes.profile.name,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: AppRoutes.createNote.path,
        name: AppRoutes.createNote.name,
        pageBuilder: (context, state) {
          final note = state.extra as Note?;
          return MaterialPage(
            fullscreenDialog: true,
            child: CreateNoteView(note: note),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.onboard.path,
        name: AppRoutes.onboard.name,
        builder: (context, state) => const OnboardView(),
      ),
      GoRoute(
        path: AppRoutes.signIn.path,
        name: AppRoutes.signIn.name,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: AppRoutes.signUp.path,
        name: AppRoutes.signUp.name,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
