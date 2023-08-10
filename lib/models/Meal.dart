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

  // Create a new Meal object from a Map (useful for databases or APIs)
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      calories: map['calories'] as int,
      protein: map['protein'] as double,
      carbs: map['carbs'] as double,
      fat: map['fat'] as double,
      ingredients: List<String>.from(map['ingredients'] as List),
      steps: List<String>.from(map['steps'] as List),
    );
  }

  // Convert the Meal object into a Map (useful for databases or APIs)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'ingredients': ingredients,
      'steps': steps,
    };
  }

  // Copy an existing Meal object with optional new values
  Meal copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    int? calories,
    double? protein,
    double? carbs,
    double? fat,
    List<String>? ingredients,
    List<String>? steps,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
    );
  }
}
