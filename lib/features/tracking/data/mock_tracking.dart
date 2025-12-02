import 'package:flutter/material.dart';

import '../domain/tracking_event.dart';

const mockTrackingEvents = [
  TrackingEvent(
    icon: Icons.check_circle,
    iconColor: Colors.green,
    title: 'En transito',
    subtitle: 'Salida del pais de origen',
    trailing: 'Hoy',
  ),
  TrackingEvent(
    icon: Icons.access_time_filled,
    iconColor: Colors.orange,
    title: 'En Aduana Ecuador',
    subtitle: 'Pendiente revision',
    trailing: 'Estimado: 3-5 dias',
  ),
];
