import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_naver_image_app/ui/search_naver/list_view_model.dart';

import '../grid_view_model.dart';
import 'grid_view.dart';

class ListView1 extends StatelessWidget {
  const ListView1({super.key});

  @override
  Widget build(BuildContext context) {
    ListViewModel viewModel = Provider.of<ListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('리스트뷰'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                if (viewModel.images.isNotEmpty)
                  for (var image in viewModel.images) Image.network(image.link),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => GridViewModel(viewModel.usecase),
                      child: GridView1(),
                    ),
                  ),
                );
              },
              child: Text('그리드뷰로'),
            ),
          ),
        ],
      ),
    );
  }
}
