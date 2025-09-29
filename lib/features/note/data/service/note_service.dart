import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notely/features/note/data/models/note_model.dart';

class NoteService {
  static final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;
  final currentUserId = _auth.currentUser?.uid ?? '';

  CollectionReference get _notesCollection =>
      _database.collection('users').doc(currentUserId).collection('notes');

  Future<bool> createNote(NoteModel note) async {
    try {
      await _notesCollection.doc().set(note.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<NoteModel>> getNotes() {
    return _notesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return NoteModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<bool> updateNote(NoteModel note) async {
    try {
      await _notesCollection.where('id', isEqualTo: note.id).get().then((
          value,
          ) {
        value.docs.first.reference.update(note.toJson());
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteNote(String noteId) async {
    try {
      await _notesCollection.where('id', isEqualTo: noteId).get().then((value) {
        value.docs.first.reference.delete();
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
