class CommunityPost {
  const CommunityPost({
    required this.author,
    required this.content,
    required this.tags,
    this.likes = 0,
  });

  final String author;
  final String content;
  final List<String> tags;
  final int likes;
}
