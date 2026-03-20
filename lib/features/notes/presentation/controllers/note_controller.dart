import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

class NoteController extends StateNotifier<AsyncValue<List<Note>>> {
  final NoteRepository repository;

  NoteController(this.repository) : super(const AsyncValue.loading()) {
    _initialize();
  }

  Future<void> _initialize() async {
    state = await AsyncValue.guard(() => repository.fetchNotes());
  }

  Future<void> addNote(Note note) async {
    state = const AsyncValue.loading();
    await repository.addNote(note);
    state = await AsyncValue.guard(() => repository.fetchNotes());
  }

  Future<void> updateNote(Note note) async {
    state = const AsyncValue.loading();
    await repository.updateNote(note);
    state = await AsyncValue.guard(() => repository.fetchNotes());
  }

  Future<void> deleteNoteById(String id) async {
    state = const AsyncValue.loading();
    await repository.deleteNote(id);
    state = await AsyncValue.guard(() => repository.fetchNotes());
  }
}

final noteControllerProvider = StateNotifierProvider<NoteController, AsyncValue<List<Note>>>(
  (ref) => NoteController(ref.read(noteRepositoryProvider)),
);

final noteRepositoryProvider = Provider<NoteRepository>((ref) => NoteRepositoryImpl());
