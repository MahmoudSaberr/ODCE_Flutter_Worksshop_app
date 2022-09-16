import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/home/notes/note_model.dart';
import 'package:login/utils/network/local/database.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context) => BlocProvider.of(context);

  List<NoteModel> notes = [];

  Future getNotes() async {
    emit(NoteGetDatabaseLoadingState());
    NotesDatabaseHelper.initDb();
    NotesDatabaseHelper.getNotes().then((value) {
      for (Map<String, dynamic> cat in value) {
        print( cat['id']);
        notes.add(NoteModel(
            id: cat['id'],
            title: cat['title'],
            description: cat['description'],
            date: cat['date']));

        print(value);
        print(notes[0].title);
      }
      emit(NoteGetDatabaseState());
    });
  }

  String addNoteTime = " ";

  Future getTime() async{
    emit(NoteTimeLoading());
    DateTime now = DateTime.now();
    addNoteTime = now.toString();
    emit(NoteTimeLoaded());
  }

  Future insertNote(
      String title,
      String description,
      String date,
      ) async {
    emit(NoteInsertDatabaseLoadingState());
    NotesDatabaseHelper.addNote(title, description, date);
    emit(NoteInsertDatabaseState());
  }

  Future updateNote(
      id,
      String title,
      String description,
      String date,
      ) async {
    emit(NoteInsertDatabaseLoadingState());
    NotesDatabaseHelper.updateNote(id,title, description, date);
    emit(NoteInsertDatabaseState());
  }

  Future deleteNote(
      id ,
      ) async {
    emit(NoteDeleteDatabaseLoadingState());
    NotesDatabaseHelper.deleteNote(id);
    emit(NoteDeleteDatabaseState());
  }



}

