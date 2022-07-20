/*
* Developer: Abubakar Abdullahi
* Date: 19/07/2022
*/

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../network/model_response.dart';
import '../network/recipe_model.dart';


class MockService {
  final _jsonRecipes = [];
  final _random = Random();
  
  void create() async {
    final recipe1 = await rootBundle.loadString('assets/recipes3.json');
    _jsonRecipes.add(json.decode(recipe1));
    final recipe2 = await rootBundle.loadString('assets/recipes4.json');
    _jsonRecipes.add(json.decode(recipe2));
  }

  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      String query,
      int from,
      int to,
      ) {
    final next = _random.nextInt(_jsonRecipes.length);
    final recipe = APIRecipeQuery.fromJson(_jsonRecipes[next]);
    final response = Response(http.Response('mock', 200), Success(recipe));
    return Future.value(response);
  }
}





// OLD CODE

// class MockService {
//   late APIRecipeQuery _currentRecipe1;
//   late APIRecipeQuery _currentRecipe2;
//
//   Random nextRecipe = Random();
//
//   void create() {
//     loadRecipes();
//   }
//
//   void loadRecipes() async {
//     var jsonString = await rootBundle.loadString('assets/recipes1.json');
//     _currentRecipe1 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
//
//     jsonString = await rootBundle.loadString('assets/recipes2.json');
//     _currentRecipe2 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
//   }
//
//   Future<Response<Result<APIRecipeQuery>>> queryRecipes(
//       String query, int from, int to) {
//     switch (nextRecipe.nextInt(2)) {
//       case 0:
//         return Future.value(Response(http.Response('Dummy', 200, request: null),
//             Success<APIRecipeQuery>(_currentRecipe1)));
//
//       case 1:
//         return Future.value(Response(http.Response('Dummy', 200, request: null),
//             Success<APIRecipeQuery>(_currentRecipe2)));
//
//       default:
//         Future.value(Response(http.Response('Dummy', 200, request: null),
//             Success<APIRecipeQuery>(_currentRecipe1)));
//     }
//   }
// }
