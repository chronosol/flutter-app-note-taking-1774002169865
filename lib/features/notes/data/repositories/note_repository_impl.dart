import 'dart:async';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final List<Note> _notes = [];

  @override
  Future<List<Note>> fetchNotes() async {
    return Future.delayed(const Duration(seconds: 1), () => _notes);
  }

  @override
  Future<void> addNote(Note note) async {
    _notes.add(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    final index = _notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      _notes[index] = note;
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
  }
}
