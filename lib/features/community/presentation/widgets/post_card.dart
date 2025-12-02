import 'package:flutter/material.dart';

import '../../../../core/widgets/clear_glass.dart';

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
    return ClearGlass(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(width: 8),
                Text(author, style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                const Icon(Icons.thumb_up_alt_outlined, size: 18),
                const SizedBox(width: 4),
                Text('$likes'),
              ],
            ),
            const SizedBox(height: 8),
            Text(content),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: tags.map((t) => Chip(label: Text(t))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
