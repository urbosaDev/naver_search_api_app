// import 'package:flutter/material.dart';
// import 'package:search_naver_image_app/data/image_model_class.dart';

// import '../../domain/models/use_case.dart';

// //execute 에 담겨있는 값은 List< 이미지모델(title,link)>
// class MyScreenViewModel extends ChangeNotifier {
//   final SearchUseCase useCase;
//   String prompt = '';
//   List<String> imageLink = [];

//   MyScreenViewModel({required this.useCase});

//   //

//   void getImageLink(prompt) async {
//     imageLink = [];
//     List<ImageModelItem> items = await useCase.execute('$prompt');
//     for (var item in items) {
//       imageLink.add(item.link);
//     }
//     notifyListeners();
//   }

//   //링크만 담은 메서드

// //
//   void inputPrompt(text) {
//     prompt = text;
//     print(prompt);
//     notifyListeners();
//   }
// }
