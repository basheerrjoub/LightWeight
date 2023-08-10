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

  static List<Meal> mealList = [
    Meal(
      id: 'm1',
      name: 'Grilled Chicken Salad',
      description: 'A light and healthy salad with grilled chicken breast.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 350,
      protein: 25.0,
      carbs: 20.0,
      fat: 10.0,
      ingredients: [
        'Chicken breast',
        'Lettuce',
        'Cherry tomatoes',
        'Cucumber',
        'Feta cheese',
        'Olive oil',
      ],
      steps: [
        'Grill the chicken until cooked.',
        'Chop all the vegetables.',
        'Mix everything in a bowl.',
        'Serve with dressing of choice.',
      ],
    ),
    Meal(
      id: 'm2',
      name: 'Veggie Pasta',
      description: 'A delightful vegetarian pasta.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 450,
      protein: 15.0,
      carbs: 60.0,
      fat: 12.0,
      ingredients: [
        'Pasta',
        'Bell peppers',
        'Zucchini',
        'Olive oil',
        'Parmesan cheese',
        'Tomato sauce',
      ],
      steps: [
        'Boil the pasta.',
        'Sautee the vegetables in olive oil.',
        'Mix pasta and vegetables.',
        'Serve with tomato sauce and parmesan.',
      ],
    ),
    Meal(
      id: 'm3',
      name: 'Classic Burger',
      description: 'Juicy beef burger with lettuce, tomato and cheese.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 550,
      protein: 30.0,
      carbs: 40.0,
      fat: 25.0,
      ingredients: [
        'Beef patty',
        'Bun',
        'Lettuce',
        'Tomato slice',
        'Cheese slice',
        'Ketchup',
      ],
      steps: [
        'Grill the beef patty.',
        'Toast the bun.',
        'Assemble the burger.',
        'Serve with fries and a drink.',
      ],
    ),
    Meal(
      id: 'm4',
      name: 'Spinach Omelette',
      description: 'Healthy spinach omelette perfect for breakfast.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 300,
      protein: 20.0,
      carbs: 5.0,
      fat: 20.0,
      ingredients: [
        'Eggs',
        'Spinach',
        'Feta cheese',
        'Salt',
        'Black pepper',
        'Olive oil',
      ],
      steps: [
        'Beat the eggs in a bowl.',
        'Add chopped spinach and feta.',
        'Season with salt and pepper.',
        'Pour into a hot pan with olive oil.',
        'Cook until set, then flip to cook the other side.',
      ],
    ),
    Meal(
      id: 'm5',
      name: 'Shrimp Stir Fry',
      description: 'A delicious shrimp stir fry with vegetables.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 700,
      protein: 25.0,
      carbs: 45.0,
      fat: 15.0,
      ingredients: [
        'Shrimp',
        'Broccoli',
        'Carrots',
        'Bell Peppers',
        'Soy Sauce',
        'Sesame Oil',
      ],
      steps: [
        'Cook shrimp in a pan until pink.',
        'Add chopped vegetables.',
        'Stir fry until vegetables are tender.',
        'Add soy sauce and stir.',
        'Serve hot with rice or noodles.',
      ],
    ),
    Meal(
      id: 'm6',
      name: 'Vegan Salad',
      description: 'Fresh salad with a variety of veggies.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 250,
      protein: 5.0,
      carbs: 20.0,
      fat: 5.0,
      ingredients: [
        'Lettuce',
        'Cucumber',
        'Carrots',
        'Avocado',
        'Olives',
        'Vegan dressing',
      ],
      steps: [
        'Chop all the ingredients.',
        'Mix them in a large bowl.',
        'Drizzle with vegan dressing.',
        'Serve immediately.',
      ],
    ),
    Meal(
      id: 'm7',
      name: 'Chicken Tacos',
      description: 'Tasty chicken tacos with lettuce and cheese.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 650,
      protein: 35.0,
      carbs: 50.0,
      fat: 25.0,
      ingredients: [
        'Chicken strips',
        'Taco shells',
        'Lettuce',
        'Tomato',
        'Cheese',
        'Salsa',
      ],
      steps: [
        'Cook chicken strips in a pan.',
        'Warm the taco shells.',
        'Add chicken, lettuce, tomato, and cheese to each taco.',
        'Serve with salsa on the side.',
      ],
    ),
    Meal(
      id: 'm8',
      name: 'Veggie Pizza',
      description: 'Delicious vegetarian pizza with mozzarella and olives.',
      imageUrl: 'assets/images/meals/meal1.png',
      calories: 800,
      protein: 30.0,
      carbs: 100.0,
      fat: 30.0,
      ingredients: [
        'Pizza base',
        'Pizza sauce',
        'Mozzarella cheese',
        'Olives',
        'Bell peppers',
        'Onions',
      ],
      steps: [
        'Spread pizza sauce on the base.',
        'Top with cheese, olives, peppers, and onions.',
        'Bake in a preheated oven until golden.',
        'Serve hot.',
      ],
    ),

  ];

}
