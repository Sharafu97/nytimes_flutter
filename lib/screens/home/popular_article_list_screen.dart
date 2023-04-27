import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_flutter/config/constants.dart';
import 'package:ny_times_flutter/networking/riverpod/riverpod.dart';
import 'package:ny_times_flutter/utils/build_context.dart';

import '../../theme/colors.dart';
import '../../widgets/custom_loading.dart';
import 'widget/popular_articles_tile.dart';

class PopularArticleListScreen extends ConsumerStatefulWidget {
  const PopularArticleListScreen({super.key});

  @override
  ConsumerState<PopularArticleListScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<PopularArticleListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(popularArticlesProvider).getPopularArticles();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('NY Times Most Popular'),
        backgroundColor: AppColors.primary,
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 20),
          Icon(Icons.more_vert_outlined),
        ],
      ),
      body: Consumer(builder: (_, ref, __) {
        final data = ref.watch(popularArticlesProvider);

        if (data.status == ApiStatus.loading) {
          return const Center(child: CustomLoadingWidget());
        } else if (data.status == ApiStatus.success) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: context.responsive(20)),
            itemBuilder: (context, index) {
              return PopularArticleTile(article: data.articles[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: data.articles.length,
          );
        } else if (data.status == ApiStatus.failed) {
          return Text(data.message);
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
