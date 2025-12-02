import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/glass_surface.dart';
import '../../../core/widgets/glass_text_field.dart';
import 'widgets/tracking_status_tile.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = maxContentWidth(context);
    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        children: [
          GlassSurface(
            maxWidth: maxWidth,
            child: const GlassTextField(
              label: 'Numero de seguimiento',
              hint: 'Ej: LB123456789CN',
              icon: Icons.local_shipping,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          GlassSurface(
            maxWidth: maxWidth,
            child: const AppSection(
              title: 'Linea de tiempo',
              spacing: AppSpacing.sm,
              child: Column(
                children: [
                  TrackingStatusTile(
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                    title: 'En transito',
                    subtitle: 'Salida del pais de origen',
                    trailing: 'Hoy',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  TrackingStatusTile(
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
          const SizedBox(height: AppSpacing.md),
          GlassSurface(
            maxWidth: maxWidth,
            child: const AppButton.primary(
              label: 'Actualizar estado',
              icon: Icons.refresh,
            ),
          ),
        ],
      ),
    );
  }
}
