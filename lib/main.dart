import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:search_naver_image_app/ui/search_naver/widgets/search_view.dart';
import 'package:search_naver_image_app/ui/search_naver/search_view_model.dart';

import 'data/repository_class.dart';
import 'data/service_class.dart';
import 'domain/models/use_case.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => SearchViewModel(
            SearchUseCase(Repository(apiService: ApiService()))),
        child: SearchView(),
      ),
    );
  }
}
