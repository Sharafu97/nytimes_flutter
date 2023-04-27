import 'package:flutter/material.dart';
import 'package:ny_times_flutter/models/user_details_model.dart';

import '../../../config/constants.dart';
import '../../repository/repository.dart';

class PopularArticleNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.initialize;
  ApiStatus get status => _status;

  String _message = '';
  String get message => _message;

  List<Articles> _articles = [];
  List<Articles> get articles => _articles;

  Future<void> getPopularArticles() async {
    if (_status == ApiStatus.loading) return;
    try {
      notifyState(ApiStatus.loading);
      final res = await AppRepository().popularArticles();
      _articles = res!.articles ?? [];
      notifyState(ApiStatus.success);
    } catch (e) {
      _message = e.toString().replaceAll('Exception: ', '');
      notifyState(ApiStatus.failed);
    }
  }

  void notifyState(ApiStatus state) {
    _status = state;
    notifyListeners();
  }
}
