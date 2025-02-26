import 'package:flutter/widgets.dart';
import 'package:search_naver_image_app/data/image_model_class.dart';
import 'package:search_naver_image_app/domain/models/use_case.dart';

class GridViewModel with ChangeNotifier {
  SearchUseCase usecase;
  List<ImageModelItem> get images => usecase.images;
  GridViewModel(this.usecase);
}