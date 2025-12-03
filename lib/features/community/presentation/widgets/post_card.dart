import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.author,
    required this.content,
    required this.tags,
    this.likes = 0,
  });

  final String author;
  final String content;
  final List<String> tags;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(width: AppSpacing.xs),
                Text(author, style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                const Icon(Icons.thumb_up_alt_outlined, size: 18),
                const SizedBox(width: AppSpacing.xxs),
                Text('$likes'),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(content),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              children: tags.map((t) => Chip(label: Text(t))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
