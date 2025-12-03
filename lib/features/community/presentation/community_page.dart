import 'package:flutter/material.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_loading_overlay.dart';
import '../../../core/widgets/app_sliver_page.dart';
import '../../../core/widgets/section_card.dart';
import '../domain/community_post.dart';
import '../domain/community_repository.dart';
import 'widgets/post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final maxWidth = maxContentWidth(context);
    final postsFuture =
        Provider.of<CommunityRepository>(context, listen: false).fetchFeed();

    return AppSliverPage(
      maxWidth: maxWidth,
      slivers: [
        SliverToBoxAdapter(
          child: FutureBuilder<List<CommunityPost>>(
            future: postsFuture,
            builder: (context, snapshot) {
              final loading = snapshot.connectionState == ConnectionState.waiting;
              final hasError = snapshot.hasError;
              final posts = snapshot.data ?? [];

              return AppLoadingOverlay(
                loading: loading,
                child: SectionCard(
                  maxWidth: maxWidth,
                  title: l10n.communityTitle,
                  spacing: AppSpacing.sm,
                  child: hasError
                      ? AppEmptyState(
                          title: l10n.communityTitle,
                          message: l10n.communityError,
                          icon: Icons.error_outline,
                        )
                      : posts.isEmpty
                          ? AppEmptyState(
                              title: l10n.communityTitle,
                              message: l10n.communityEmpty,
                              icon: Icons.forum_outlined,
                            )
                          : Column(
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
              );
            },
          ),
        ),
      ],
    );
  }
}
