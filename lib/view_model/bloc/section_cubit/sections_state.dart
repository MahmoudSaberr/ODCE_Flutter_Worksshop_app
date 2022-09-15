
abstract class SectionsState {}

class SectionsInitial extends SectionsState {}

class GetSectionsSuccessState extends SectionsState {}

class GetSectionsErrorState extends SectionsState {
  final String error;

  GetSectionsErrorState(this.error);
}

class GetSectionsLoadingState extends SectionsState {}


