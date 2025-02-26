import '../../data/image_model_class.dart';
import '../../data/repository_class.dart';

class SearchUseCase {
  final Repository repository;
  SearchUseCase(this.repository);
  List<ImageModelItem> images = [];

  Future<bool> execute(String prompt) async{
    final res = await repository.getImageFromApi(prompt);
    if (res != null) {
      images = res.items;
      return true;
    }
    return false;
  }
}
