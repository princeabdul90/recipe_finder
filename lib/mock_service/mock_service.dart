/*
* Developer: Abubakar Abdullahi
* Date: 19/07/2022
*/

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../network/service_interface.dart';
import '../network/model_response.dart';
import '../network/recipe_model.dart';


class MockService implements ServiceInterface {
  final _jsonRecipes = [];
  final _random = Random();
  
  void create() async {
    final recipe1 = await rootBundle.loadString('assets/recipes3.json');
    _jsonRecipes.add(json.decode(recipe1));
    final recipe2 = await rootBundle.loadString('assets/recipes4.json');
    _jsonRecipes.add(json.decode(recipe2));
  }

  @override
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



