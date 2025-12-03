import 'community_post.dart';

abstract class CommunityRepository {
  List<CommunityPost> fetchFeed();
}
