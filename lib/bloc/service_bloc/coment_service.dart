class ComentService {
  int? id;
  String? description;
  CommentedBy? commentedBy;
  int? idService;

  ComentService({this.id, this.description, this.commentedBy, this.idService});

  ComentService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    commentedBy = json['commentedBy'] != null
        ? CommentedBy.fromJson(json['commentedBy'])
        : null;
    idService = json['idService'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    if (commentedBy != null) {
      data['commentedBy'] = commentedBy!.toJson();
    }
    data['idService'] = idService;
    return data;
  }
}

class CommentedBy {
  int? id;
  String? nickName;
  String? picturePath;

  CommentedBy({this.id, this.nickName, this.picturePath});

  CommentedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickName = json['nickName'];
    picturePath = json['picturePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickName'] = nickName;
    data['picturePath'] = picturePath;
    return data;
  }

  @override
  String toString() {
    return picturePath!;
  }
}
