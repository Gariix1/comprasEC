import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/glass_surface.dart';
import '../../../core/widgets/glass_text_field.dart';
import 'widgets/offer_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cols = gridColumns(context, mobile: 1, tablet: 2, desktop: 3);
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
          AppSection(
            title: 'Resultados destacados',
            action: const AppButton.secondary(
              label: 'Crear alerta',
              icon: Icons.notifications_outlined,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                mainAxisSpacing: AppSpacing.sm,
                crossAxisSpacing: AppSpacing.sm,
                childAspectRatio: 1.6,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GlassSurface(
                  child: OfferCard(
                    title: 'Producto #${index + 1}',
                    marketplaces: 'Temu • AliExpress • Amazon • Shein',
                    price: '\$99.99',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
