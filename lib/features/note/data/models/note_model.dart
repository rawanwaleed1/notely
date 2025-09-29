class NoteModel {
  final String id;
  final String title;
  final String description;

  NoteModel({this.id = '', required this.title, required this.description});

  static NoteModel fromJson(Map<String, dynamic> json) => NoteModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'id': DateTime.now().millisecondsSinceEpoch.toString(),
    'title': title,
    'description': description,
  };
}