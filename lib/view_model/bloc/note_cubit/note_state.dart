part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteCreateDatabaseState extends NoteState {}

class NoteGetDatabaseLoadingState extends NoteState {}

class NoteGetDatabaseState extends NoteState {}

class NoteInsertDatabaseState extends NoteState {}

class NoteInsertDatabaseLoadingState extends NoteState {}

class NoteUpdateDatabaseState extends NoteState {}

class NoteDeleteDatabaseState extends NoteState {}

class NoteDeleteDatabaseLoadingState extends NoteState {}

class NoteTimeLoaded extends NoteState {}

class NoteTimeLoading extends NoteState {}
