import 'package:flutter/material.dart';

import '../../../core/localization/strings.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_loading_overlay.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/glass_form_text_field.dart';
import '../../../core/widgets/glass_surface.dart';
import '../../../core/services/repository_provider.dart';
import 'widgets/tracking_status_tile.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final TextEditingController _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = maxContentWidth(context);
    final trackingEvents = RepositoryProvider.tracking.fetchTrackingEvents(_controller.text);
    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        children: [
          GlassSurface(
            maxWidth: maxWidth,
            child: GlassFormTextField(
              controller: _controller,
              label: Strings.trackingNumber,
              hint: Strings.trackingHint,
              icon: Icons.local_shipping,
              errorText: _error,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppLoadingOverlay(
            loading: false,
            child: GlassSurface(
              maxWidth: maxWidth,
              child: AppSection(
                title: Strings.trackingTimeline,
                spacing: AppSpacing.sm,
                child: trackingEvents.isEmpty
                    ? const AppEmptyState(
                        title: Strings.trackingTimeline,
                        message: 'No hay eventos para este tracking',
                        icon: Icons.local_shipping_outlined,
                      )
                    : Column(
                        children: [
                          for (var i = 0; i < trackingEvents.length; i++) ...[
                            TrackingStatusTile(
                              icon: trackingEvents[i].icon,
                              iconColor: trackingEvents[i].iconColor,
                              title: trackingEvents[i].title,
                              subtitle: trackingEvents[i].subtitle,
                              trailing: trackingEvents[i].trailing,
                            ),
                            if (i != trackingEvents.length - 1)
                              const SizedBox(height: AppSpacing.sm),
                          ],
                        ],
                      ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          GlassSurface(
            maxWidth: maxWidth,
            child: AppButton.primary(
              label: Strings.trackingRefresh,
              icon: Icons.refresh,
              onPressed: () {
                setState(() {
                  _error = _controller.text.isEmpty ? 'Ingresa un numero valido' : null;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
