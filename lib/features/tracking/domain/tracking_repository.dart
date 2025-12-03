import 'tracking_event.dart';

abstract class TrackingRepository {
  Future<List<TrackingEvent>> fetchTrackingEvents(String trackingId);
}
