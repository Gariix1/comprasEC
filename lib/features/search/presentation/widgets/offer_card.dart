import 'package:flutter/material.dart';

import '../../../../core/widgets/clear_glass.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.title,
    required this.marketplaces,
    required this.price,
  });

  final String title;
  final String marketplaces;
  final String price;

  @override
  Widget build(BuildContext context) {
    return ClearGlass(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.local_mall)),
        title: Text(title),
        subtitle: Text(marketplaces),
        trailing: Text(price),
      ),
    );
  }
}
