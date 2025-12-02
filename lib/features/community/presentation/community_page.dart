import 'package:flutter/material.dart';

import '../../../core/widgets/app_background.dart';
import '../../../core/widgets/section_title.dart';
import 'widgets/post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunidad'),
      ),
      body: AppBackground(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return PostCard(
              author: 'Usuario${index + 1}',
              likes: 12,
              content:
                  'Mi experiencia comprando en Temu: llego en 12 dias, revisado por aduana sin impuestos.',
              tags: const ['Temu', 'Envio', 'Ecuador'],
            );
          },
        ),
      ),
    );
  }
}
