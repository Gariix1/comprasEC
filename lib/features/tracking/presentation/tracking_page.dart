import 'package:flutter/material.dart';

import '../../../core/widgets/app_background.dart';
import '../../../core/widgets/glass_text_field.dart';
import '../../../core/widgets/section_title.dart';
import 'widgets/tracking_status_tile.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracker'),
      ),
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const GlassTextField(
                label: 'Numero de seguimiento',
                hint: 'Ej: LB123456789CN',
                icon: Icons.local_shipping,
              ),
              const SizedBox(height: 16),
              const SectionTitle('Linea de tiempo'),
              const SizedBox(height: 12),
              const TrackingStatusTile(
                icon: Icons.check_circle,
                iconColor: Colors.green,
                title: 'En transito',
                subtitle: 'Salida del pais de origen',
                trailing: 'Hoy',
              ),
              const SizedBox(height: 12),
              const TrackingStatusTile(
                icon: Icons.access_time_filled,
                iconColor: Colors.orange,
                title: 'En Aduana Ecuador',
                subtitle: 'Pendiente revision',
                trailing: 'Estimado: 3-5 dias',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
