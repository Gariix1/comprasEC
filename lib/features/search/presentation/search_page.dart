import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:animations/animations.dart';

import '../../../core/services/providers.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_action_bar.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_loading_overlay.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/glass_text_field.dart';
import '../../../core/widgets/section_card.dart';
import '../domain/offer.dart';
import 'widgets/offer_card.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late Future<List<Offer>> _offersFuture;

  @override
  void initState() {
    super.initState();
    _offersFuture = ref.read(searchRepositoryProvider).fetchFeatured();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final future = _offersFuture;
    final delegate = cardGridDelegate(context);
    final maxWidth = maxContentWidth(context);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: FutureBuilder<List<Offer>>(
        future: future,
        builder: (context, snapshot) {
          final loading = snapshot.connectionState == ConnectionState.waiting;
          final hasError = snapshot.hasError;
          final data = snapshot.data ?? [];

          return AppLoadingOverlay(
            loading: loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassTextField(
                  label: l10n.searchPlaceholder,
                  hint: l10n.searchHint,
                  icon: Icons.search,
                ),
                const SizedBox(height: AppSpacing.md),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  transitionBuilder: (child, animation) => FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: animation,
                    child: child,
                  ),
                  child: hasError
                      ? AppEmptyState(
                          key: const ValueKey('search-error'),
                          title: l10n.searchFeatured,
                          message: l10n.errorGeneric,
                          icon: Icons.error_outline,
                        )
                      : data.isEmpty
                          ? AppEmptyState(
                              key: const ValueKey('search-empty'),
                              title: l10n.searchFeatured,
                              message: l10n.searchEmptyMessage,
                              icon: Icons.search_off,
                            )
                          : SectionCard(
                              key: const ValueKey('search-data'),
                              title: l10n.searchFeatured,
                              action: AppActionBar(
                                children: [
                                  AppButton.secondary(
                                    label: l10n.searchCreateAlert,
                                    icon: Icons.notifications_outlined,
                                  ),
                                  AppButton.primary(
                                    label: l10n.searchFilter,
                                    icon: Icons.filter_list,
                                  ),
                                ],
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: delegate,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final Offer offer = data[index];
                                  return OfferCard(
                                    title: offer.title,
                                    marketplaces: offer.marketplaces,
                                    price: offer.price,
                                  );
                                },
                              ),
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
