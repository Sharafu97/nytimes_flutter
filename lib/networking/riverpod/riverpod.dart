import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/popular_article_notifier.dart';

final popularArticlesProvider =
    ChangeNotifierProvider((ref) => PopularArticleNotifier());
