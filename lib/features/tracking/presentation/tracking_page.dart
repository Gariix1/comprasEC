import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:animations/animations.dart';

import '../../../core/services/providers.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_loading_overlay.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/glass_form_text_field.dart';
import '../../../core/widgets/glass_surface.dart';
import '../domain/tracking_event.dart';
import 'widgets/tracking_status_tile.dart';

class TrackingPage extends ConsumerStatefulWidget {
  const TrackingPage({super.key});

  @override
  ConsumerState<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends ConsumerState<TrackingPage> {
  final TextEditingController _controller = TextEditingController();
  String? _error;
  Future<List<TrackingEvent>>? _futureEvents;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final maxWidth = maxContentWidth(context);
    final repo = ref.read(trackingRepositoryProvider);
    _futureEvents ??= repo.fetchTrackingEvents(_controller.text);
    final futureEvents = _futureEvents!;
    return AppPageScaffold(
      maxWidth: maxWidth,
      child: FutureBuilder<List<TrackingEvent>>(
        future: futureEvents,
        builder: (context, snapshot) {
          final loading = snapshot.connectionState == ConnectionState.waiting;
          final hasError = snapshot.hasError;
          final events = snapshot.data ?? [];

          return Column(
            children: [
              GlassSurface(
                maxWidth: maxWidth,
                child: GlassFormTextField(
                  controller: _controller,
                  label: l10n.trackingNumber,
                  hint: l10n.trackingHint,
                  icon: Icons.local_shipping,
                  errorText: _error,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppLoadingOverlay(
                loading: loading,
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: AppSection(
                      title: l10n.trackingTimeline,
                      spacing: AppSpacing.sm,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 220),
                        transitionBuilder: (child, animation) => FadeThroughTransition(
                          animation: animation,
                          secondaryAnimation: animation,
                          child: child,
                        ),
                        child: hasError
                            ? AppEmptyState(
                                key: const ValueKey('tracking-error'),
                                title: l10n.trackingTimeline,
                                message: l10n.trackingError,
                                icon: Icons.error_outline,
                              )
                            : events.isEmpty
                                ? AppEmptyState(
                                    key: const ValueKey('tracking-empty'),
                                    title: l10n.trackingTimeline,
                                    message: l10n.trackingEmptyMessage,
                                    icon: Icons.local_shipping_outlined,
                                  )
                                : Column(
                                    key: const ValueKey('tracking-data'),
                                    children: [
                                      for (var i = 0; i < events.length; i++) ...[
                                        TrackingStatusTile(
                                          icon: events[i].icon,
                                          iconColor: events[i].iconColor,
                                          title: events[i].title,
                                          subtitle: events[i].subtitle,
                                          trailing: events[i].trailing,
                                        ),
                                        if (i != events.length - 1)
                                          const SizedBox(height: AppSpacing.sm),
                                      ],
                                    ],
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: AppButton.primary(
                    label: l10n.trackingRefresh,
                    icon: Icons.refresh,
                    onPressed: () {
                      setState(() {
                        _error = Validators.requiredField(
                          _controller.text,
                          message: l10n.trackingErrorInvalid,
                        );
                        if (_error == null) {
                          _futureEvents =
                              ref.read(trackingRepositoryProvider).fetchTrackingEvents(
                                    _controller.text,
                                  );
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
