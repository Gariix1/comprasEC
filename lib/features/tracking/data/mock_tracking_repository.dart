import '../domain/tracking_event.dart';
import '../domain/tracking_repository.dart';
import 'mock_tracking.dart';

class MockTrackingRepository implements TrackingRepository {
  const MockTrackingRepository();

  @override
  List<TrackingEvent> fetchTrackingEvents(String trackingId) {
    // Ignoring trackingId; return mock data.
    return mockTrackingEvents;
  }
}
