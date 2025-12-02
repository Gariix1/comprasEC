import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_action_bar.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/glass_surface.dart';
import '../../../core/widgets/glass_text_field.dart';
import '../../../core/widgets/section_card.dart';
import '../data/mock_offers.dart';
import 'widgets/offer_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final delegate = cardGridDelegate(context);
    final maxWidth = maxContentWidth(context);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const GlassTextField(
            label: 'Buscar producto',
            hint: 'Ej: smartwatch, audifonos, ropa',
            icon: Icons.search,
          ),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            title: 'Resultados destacados',
            action: AppActionBar(
              children: const [
                AppButton.secondary(
                  label: 'Crear alerta',
                  icon: Icons.notifications_outlined,
                ),
                AppButton.primary(
                  label: 'Filtrar',
                  icon: Icons.filter_list,
                ),
              ],
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: delegate,
              itemCount: mockOffers.length,
              itemBuilder: (context, index) {
                final offer = mockOffers[index];
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
    );
  }
}
