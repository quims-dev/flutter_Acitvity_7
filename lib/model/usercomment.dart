class Usercomment {
  final String commenterImg;
  final String commenterName;
  final String commenterTime;
  final String commenterContent;
  final List<Usercomment> replies;
  bool isLiked;
  int numLikes;

  Usercomment({
    required this.commenterImg,
    required this.commenterName,
    required this.commenterTime,
    required this.commenterContent,
    this.replies = const [],
    this.isLiked = false,
    this.numLikes = 0,
  });

  Usercomment copyWith({
    String? commenterImg,
    String? commenterName,
    String? commenterTime,
    String? commenterContent,
    List<Usercomment>? replies,
    bool? isLiked,
    int? numLikes,
  }) {
    return Usercomment(
      commenterImg: commenterImg ?? this.commenterImg,
      commenterName: commenterName ?? this.commenterName,
      commenterTime: commenterTime ?? this.commenterTime,
      commenterContent: commenterContent ?? this.commenterContent,
      replies: replies ?? this.replies,
      isLiked: isLiked ?? this.isLiked,
      numLikes: numLikes ?? this.numLikes,
    );
  }
}
