import 'package:flutter/material.dart';

import '../../../core/localization/strings.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_action_bar.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_loading_overlay.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/glass_surface.dart';
import '../../../core/widgets/glass_text_field.dart';
import '../../../core/widgets/section_card.dart';
import '../../../core/services/repository_provider.dart';
import '../domain/offer.dart';
import 'widgets/offer_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = RepositoryProvider.search.fetchFeatured();
    final delegate = cardGridDelegate(context);
    final maxWidth = maxContentWidth(context);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: AppLoadingOverlay(
        loading: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const GlassTextField(
              label: Strings.searchPlaceholder,
              hint: Strings.searchHint,
              icon: Icons.search,
            ),
            const SizedBox(height: AppSpacing.md),
            if (offers.isEmpty)
              const AppEmptyState(
                title: Strings.searchFeatured,
                message: 'No hay resultados aún. Prueba otra busqueda o crea una alerta.',
                icon: Icons.search_off,
              )
            else
              SectionCard(
                title: Strings.searchFeatured,
                action: AppActionBar(
                  children: const [
                    AppButton.secondary(
                      label: Strings.searchCreateAlert,
                      icon: Icons.notifications_outlined,
                    ),
                    AppButton.primary(
                      label: Strings.searchFilter,
                      icon: Icons.filter_list,
                    ),
                  ],
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: delegate,
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final Offer offer = offers[index];
                    return OfferCard(
                      title: offer.title,
                      marketplaces: offer.marketplaces,
                      price: offer.price,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
