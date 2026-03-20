import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

class NoteController extends AsyncNotifier<List<Note>> {
  final NoteRepository repository;

  NoteController(this.repository);

  @override
  Future<List<Note>> build() async {
    return repository.fetchNotes();
  }

  Future<void> addNote(Note note) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repository.addNote(note));
    state = await AsyncValue.guard(() => repository.fetchNotes());
  }

  Future<void> updateNote(Note note) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repository.updateNote(note));
    state = await AsyncValue.guard(() => repository.fetchNotes());
  }

  Future<void> deleteNoteById(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repository.deleteNote(id));
    state = await AsyncValue.guard(() => repository.fetchNotes());
  }
}

final noteControllerProvider = AsyncNotifierProvider<NoteController, List<Note>>(
  (ref) => NoteController(ref.read(noteRepositoryProvider)),
);

final noteRepositoryProvider = Provider<NoteRepository>((ref) => NoteRepositoryImpl());
