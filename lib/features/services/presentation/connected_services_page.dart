import 'package:flutter/material.dart';

import '../../../core/widgets/app_list_tile.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/section_list_block.dart';
import '../../../core/theme/app_spacing.dart';

class ConnectedServicesPage extends StatelessWidget {
  const ConnectedServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const services = [
      ('Temu', Icons.shopping_bag_outlined),
      ('Amazon', Icons.store_mall_directory_outlined),
      ('AliExpress', Icons.local_mall_outlined),
      ('Alibaba', Icons.public_outlined),
    ];

    return AppPageScaffold(
      child: SectionListBlock(
        title: 'Servicios conectados',
        spacing: AppSpacing.sm,
        children: services
            .map(
              (s) => AppListTile(
                icon: s.$2,
                title: s.$1,
                subtitle: 'Conectar o gestionar tu cuenta de ${s.$1}',
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Placeholder for service connection flow.
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
