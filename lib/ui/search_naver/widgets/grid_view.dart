import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_naver_image_app/ui/search_naver/grid_view_model.dart';
import 'package:search_naver_image_app/ui/search_naver/search_view_model.dart';
import 'package:search_naver_image_app/ui/search_naver/widgets/search_view.dart';

class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    GridViewModel viewModel = Provider.of<GridViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('그리드뷰에용~'),
      ),
      body: Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            if (viewModel.images.length > 0)
              for (var image in viewModel.images) Image.network(image.link),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => SearchViewModel(viewModel.usecase),
                      child: SearchView(),
                    ),
                  ),
                );
              },
              child: Text('검색창으로~'),
            ),
          ],
        ),
      ),
    );
  }
}
