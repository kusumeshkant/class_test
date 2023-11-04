class Note {
  int? id;
  String? title;
  String? description;
  bool? isImportant;

  Note({this.isImportant, this.id, this.description, this.title});

  Note.fromMap(Map<String, dynamic> json) {
    this.id = json["id"];
    this.description = json["content"];
    this.isImportant = json["noteColor"];
    this.title = json["title"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();

    if (id != null) {
      data["id"] = this.id;
    }
    data["title"] = this.title;
    data["isImportant"] = this.isImportant;
    data["description"] = this.description;
    return data;
  }
}
