import '../entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> fetchNotes();
  Future<void> addNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String id);
}
