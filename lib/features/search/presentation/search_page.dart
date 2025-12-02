import 'package:flutter/material.dart';

import '../../../core/widgets/app_background.dart';
import '../../../core/widgets/glass_text_field.dart';
import '../../../core/widgets/section_title.dart';
import 'widgets/offer_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparador'),
      ),
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const GlassTextField(
                label: 'Buscar producto',
                hint: 'Ej: smartwatch, audifonos, ropa',
                icon: Icons.search,
              ),
              const SizedBox(height: 16),
              const SectionTitle('Resultados destacados'),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return OfferCard(
                      title: 'Producto #${index + 1}',
                      marketplaces: 'Temu • AliExpress • Amazon • Shein',
                      price: '\$99.99',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
