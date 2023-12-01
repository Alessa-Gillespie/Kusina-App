//to create a Recipe object for recipes bank
class Recipe {

  // Recipe(){
  //   name='Recipe name';
  //   imagePath='';
  //   ingredientsList = ['1 cup item','1 cup item','1 cup item'];
  //   instructionsList = ['1. do this', '1. do this', '1. do this'];
  // }

  Recipe({required this.name,
    required this.imagePath,
    required this.ingredientsList,
    required this.instructionsList,
    required this.sourceLink});
  String name;
  String? imagePath;
  List<String>? ingredientsList;
  List<String>? instructionsList;
  //video
  String sourceLink;
}