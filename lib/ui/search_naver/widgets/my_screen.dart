// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:search_naver_image_app/ui/search_naver/view_model.dart';

// class MyScreen extends StatefulWidget {
//   MyScreen({super.key});

//   @override
//   State<MyScreen> createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   Object? get items => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('네이버 검색앱~'),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Image.network('')
//             // 첫번째로 텍스트 입력 폼 ,
//             Consumer<MyScreenViewModel>(
//               builder: (context, viewModel, child) {
//                 return Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         onChanged: (value) {
//                           viewModel.inputPrompt(value);
//                         },
//                         decoration: InputDecoration(
//                           hintText: '검색어를 입력해보세용~',
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           print(viewModel?.prompt);
//                           viewModel.getImageLink(viewModel.prompt);
//                           print('----------');
//                           for (var items in viewModel.imageLink) {
//                             print(items);
//                           }
//                         },
//                         icon: const Icon(Icons.search)),
//                   ],
//                 );
//               },
//             ),
//             // 큰 컨테이너 내부는 콜론,
//             Container(),
//             Container(
//               // 리스트 받아서 뿌리는곳
//               child: Consumer<MyScreenViewModel>(
//                 builder: (context, viewModel, child) {
//                   return Expanded(
//                     child: ListView(
//                       children: [
//                         if (viewModel.imageLink.length > 0)
//                           for (var image in viewModel.imageLink)
//                             Image.network(
//                               image,
//                             ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
