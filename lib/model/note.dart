class Note {
  int? id;
  int? categoryId;
  String? note;

  Note({this.id, this.categoryId, this.note});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        categoryId: json['categoryId'],
        note: json['note'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['categoryId'] = categoryId;
    data['note'] = note;
    return data;
  }
}
