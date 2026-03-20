import 'package:go_router/go_router.dart';
import '../../features/notes/presentation/screens/notes_screen.dart';

final appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const NotesScreen(),
    ),
  ],
);
