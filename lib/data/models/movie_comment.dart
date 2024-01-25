class MovieComment{
  MovieComment({required this.id, required this.comment, required this.createdAt});

  final int id;
  final String comment;
  final DateTime createdAt;

  factory MovieComment.fromJson(Map<String, dynamic> json) => MovieComment(
    id: json['id'], 
    comment: json['comment'], 
    createdAt: DateTime.parse(json['date_created']),
  );
}