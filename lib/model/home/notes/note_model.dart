class NoteModel{
  String? title="";
  String? date="";
  String? description="";
  int id = -1;

  NoteModel({required this.id, required this.title, required this.description, required this.date});

  NoteModel.fromMap(Map<String,dynamic> map) {
    title = map['title'];
    date = map['date'];
    description = map['description'];
    id = map['id'];
  }
}