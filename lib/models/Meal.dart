class Meal {
  final String id; // Unique identifier for the meal
  final String name; // Name of the meal
  final String description; // A short description of the meal
  final String imageUrl; // URL for the meal's image
  final int calories; // Calories in the meal
  final double protein; // Grams of protein in the meal
  final double carbs; // Grams of carbohydrates in the meal
  final double fat; // Grams of fat in the meal
  final List<String> ingredients; // List of ingredients used in the meal
  final List<String> steps; // Cooking/preparation steps

  // Constructor
  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.ingredients,
    required this.steps,
  });



}
