import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/glass_surface.dart';
import 'widgets/post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = maxContentWidth(context);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        children: List.generate(3, (index) {
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : AppSpacing.sm),
            child: GlassSurface(
              maxWidth: maxWidth,
              child: AppSection(
                title: index == 0 ? 'Comunidad' : '',
                spacing: AppSpacing.sm,
                child: PostCard(
                  author: 'Usuario${index + 1}',
                  likes: 12,
                  content:
                      'Mi experiencia comprando en Temu: llego en 12 dias, revisado por aduana sin impuestos.',
                  tags: const ['Temu', 'Envio', 'Ecuador'],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
