/*
* Developer: Abubakar Abdullahi
* Date: 19/07/2022
*/

import 'models/models.dart';

abstract class Repository {

  // find methods
  List<Recipe> findAllRecipes();

  Recipe findRecipeById(int id);

  List<Ingredient> findAllIngredients();

  List<Ingredient> findRecipeIngredients(int recipeId);

  // insert methods
  int insertRecipe(Recipe recipe);

  List<int> insertIngredients(List<Ingredient> ingredients);

  // delete methods
  void deleteRecipe(Recipe recipe);

  void deleteIngredient(Ingredient ingredient);

  void deleteIngredients(List<Ingredient> ingredient);

  void deleteRecipeIngredients(int recipeId);


  // initializing and closing methods
  Future init();

  void close();

}