import 'package:flutter/material.dart';
import '../../domain/models/use_case.dart';

enum SearchState { idle, searching, complete, error }

class SearchViewModel with ChangeNotifier {
  SearchUseCase useCase;
  SearchState state = SearchState.idle;
  SearchViewModel(this.useCase);
  Future<void> search(String prompt) async {
    state = SearchState.searching;
    notifyListeners();

    final result = await useCase.execute(prompt);
    if (result) {
      state = SearchState.complete;
      notifyListeners();
    } else {
      state = SearchState.error;
      notifyListeners();
    }
  }
}
