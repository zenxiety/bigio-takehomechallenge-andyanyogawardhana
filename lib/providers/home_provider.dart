import 'package:flutter/material.dart';
import 'package:takehomechallenge_andyanyogawardhana/models/characters_model.dart';
import 'package:takehomechallenge_andyanyogawardhana/services/character_services.dart';
import 'package:takehomechallenge_andyanyogawardhana/utils/constants/loading_state.dart';

class HomeProvider with ChangeNotifier {
  final GlobalKey dataKey = GlobalKey();

  LoadingState loadingState = LoadingState.initial;

  CharactersModel? charactersModel;
  int currentPage = 0;

  void getCharacters({required int page}) async {
    try {
      loadingState = LoadingState.loading;

      final characters = await CharacterServices.getCharacters(page: page);

      charactersModel = characters;
      currentPage = page;

      debugPrint(characters.results[0].id.toString());

      loadingState = LoadingState.success;
      notifyListeners();
    } catch (e) {
      loadingState = LoadingState.failed;
    }
  }

  void tapCharacter(BuildContext context, {required Result character}) {
    Navigator.pushNamed(context, '/detail', arguments: character);
  }

  void prevPage() {
    if (currentPage != 0) {
      getCharacters(page: --currentPage);
      notifyListeners();
    }
  }

  void nextPage() {
    if (currentPage != charactersModel!.info.pages) {
      getCharacters(page: ++currentPage);
      notifyListeners();
    }
  }
}
