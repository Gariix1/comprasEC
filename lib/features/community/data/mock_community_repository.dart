import '../domain/community_post.dart';
import '../domain/community_repository.dart';
import 'mock_posts.dart';

class MockCommunityRepository implements CommunityRepository {
  const MockCommunityRepository();

  @override
  Future<List<CommunityPost>> fetchFeed() async => mockPosts;
}
