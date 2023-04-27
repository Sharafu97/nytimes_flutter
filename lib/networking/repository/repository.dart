import '../../config/constants.dart';
import '../../models/user_details_model.dart';
import '../api_provider/api_provider.dart';

abstract class Repository {
  Future<PopularArticleModel>? popularArticles() {
    return null;
  }
}

class AppRepository implements Repository {
  final provider = ApiProvider();

  @override
  Future<PopularArticleModel>? popularArticles() async {
    final res = await provider.getData(
      '/svc/mostpopular/v2/mostviewed/all-sections/7.json',
      queryParameters: {'api-key': AppConstants.apiKey},
    );
    return PopularArticleModel.fromJson(res);
  }
}
