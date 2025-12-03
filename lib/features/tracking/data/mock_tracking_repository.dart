import '../domain/tracking_event.dart';
import '../domain/tracking_repository.dart';
import 'mock_tracking.dart';

class MockTrackingRepository implements TrackingRepository {
  const MockTrackingRepository();

  @override
  Future<List<TrackingEvent>> fetchTrackingEvents(String trackingId) async => mockTrackingEvents;
}
