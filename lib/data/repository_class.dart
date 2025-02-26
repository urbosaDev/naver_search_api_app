import 'image_model_class.dart';
import 'service_class.dart';

class Repository {
  const Repository({required this.apiService});
  final ApiService apiService;

  Future<ImageModel?> getImageFromApi(prompt) async {
    return await apiService.getImageFromApi(prompt);
  }
}

// 하나하나 설명해보자
