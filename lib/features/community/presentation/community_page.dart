import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/section_card.dart';
import '../data/mock_posts.dart';
import 'widgets/post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = maxContentWidth(context);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: SectionCard(
        maxWidth: maxWidth,
        title: 'Comunidad',
        spacing: AppSpacing.sm,
        child: Column(
          children: mockPosts
              .map(
                (post) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: PostCard(
                    author: post.author,
                    likes: post.likes,
                    content: post.content,
                    tags: post.tags,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
