import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_naver_image_app/ui/search_naver/list_view_model.dart';
import 'package:search_naver_image_app/ui/search_naver/search_view_model.dart';
import 'package:search_naver_image_app/ui/search_naver/widgets/list_view.dart';

class SearchView extends StatelessWidget {
  final promptTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchViewModel viewModel = Provider.of<SearchViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {

        if (viewModel.state == SearchState.complete) {
            // 성공시 grid view 로 이동
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (_) => ListViewModel(viewModel.useCase),//필요한거 넣어서,
                        child: ListView1()
                    ), 
                ),
            );
        }
    });
    
    Widget serachBar() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: promptTextController,
                      decoration: InputDecoration(
                        hintText: '검색어를 입력해보세용~',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        viewModel.search(promptTextController.text);
                      }, icon: const Icon(Icons.search)),
                ],
              )
          ],
        );
    }

    Widget body() {
      if (viewModel.state == SearchState.searching) {
        return Center(child: CircularProgressIndicator());
      } else if (viewModel.state == SearchState.complete) {
        return Center(child: Text("검색 완료! 결과를 여기서 표시하세요."));
      } else if (viewModel.state == SearchState.error) {
        return Center(
          child: Text(
            "검색 중 에러가 발생했습니다. 다시 시도해주세요.",
            style: TextStyle(color: Colors.red),
          ),
        );
      } else {
                return serachBar();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('네이버 검색앱~'),
      ),
      body: SafeArea(
        child: body())
    );
  }
}
