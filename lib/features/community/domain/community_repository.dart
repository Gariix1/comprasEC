import 'community_post.dart';

abstract class CommunityRepository {
  Future<List<CommunityPost>> fetchFeed();
}
