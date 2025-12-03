import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

import '../../../core/services/providers.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_loading_overlay.dart';
import '../../../core/widgets/app_sliver_page.dart';
import '../../../core/widgets/section_list_block.dart';
import '../domain/community_post.dart';
import 'widgets/post_card.dart';

class CommunityPage extends ConsumerWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final maxWidth = maxContentWidth(context);
    final postsFuture = ref.read(communityRepositoryProvider).fetchFeed();

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
                child: SectionListBlock(
                  maxWidth: maxWidth,
                  title: l10n.communityTitle,
                  spacing: AppSpacing.sm,
                  children: hasError
                      ? [
                          AppEmptyState(
                            title: l10n.communityTitle,
                            message: l10n.communityError,
                            icon: Icons.error_outline,
                          ),
                        ]
                      : posts.isEmpty
                          ? [
                              AppEmptyState(
                                title: l10n.communityTitle,
                                message: l10n.communityEmpty,
                                icon: Icons.forum_outlined,
                              ),
                            ]
                          : posts
                              .map(
                                (post) => PostCard(
                                  author: post.author,
                                  likes: post.likes,
                                  content: post.content,
                                  tags: post.tags,
                                ),
                              )
                              .toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
