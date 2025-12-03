import 'tracking_event.dart';

abstract class TrackingRepository {
  List<TrackingEvent> fetchTrackingEvents(String trackingId);
}
