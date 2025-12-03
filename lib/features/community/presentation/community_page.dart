import 'package:flutter/material.dart';

import '../../../core/localization/strings.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/services/repository_provider.dart';
import '../../../core/widgets/app_sliver_page.dart';
import '../../../core/widgets/section_card.dart';
import 'widgets/post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = maxContentWidth(context);
    final posts = RepositoryProvider.community.fetchFeed();

    return AppSliverPage(
      maxWidth: maxWidth,
      slivers: [
        SliverToBoxAdapter(
          child: SectionCard(
            maxWidth: maxWidth,
            title: Strings.communityTitle,
            spacing: AppSpacing.sm,
            child: Column(
              children: posts
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
        ),
      ],
    );
  }
}
