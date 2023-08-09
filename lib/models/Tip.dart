class Tip {
  final String title;
  final String briefDescription;
  final String detailedDescription;
  final String imagePath; // path to your asset image

  Tip({
    required this.title,
    required this.briefDescription,
    required this.detailedDescription,
    required this.imagePath,
  });
}

List<Tip> dummyTips = [
  Tip(
    title: "Stay Hydrated",
    briefDescription: "Drinking water is important during workouts.",
    detailedDescription: "When you're working out, especially in warm weather, it's vital to drink plenty of water. It helps you stay cool, hydrated, and can even help improve your workout performance.",
    imagePath: 'assets/images/background_auth.png',  // path to your image asset
  ),
  Tip(
    title: "Eat Balanced Diet",
    briefDescription: "Proper diet is crucial for fitness.",
    detailedDescription: "Include a balance of protein, carbs, and fats in your diet. Eat fruits, vegetables, lean protein, and whole grains, and avoid processed foods and sugary drinks.",
    imagePath: 'assets/images/background_auth.png',  // path to your image asset
  ),
  Tip(
    title: "Eat Balanced Diet",
    briefDescription: "Proper diet is crucial for fitness.",
    detailedDescription: "Include a balance of protein, carbs, and fats in your diet. Eat fruits, vegetables, lean protein, and whole grains, and avoid processed foods and sugary drinks.",
    imagePath: 'assets/images/background_auth.png',  // path to your image asset
  ),
  Tip(
    title: "Eat Balanced Diet",
    briefDescription: "Proper diet is crucial for fitness.",
    detailedDescription: "Include a balance of protein, carbs, and fats in your diet. Eat fruits, vegetables, lean protein, and whole grains, and avoid processed foods and sugary drinks.",
    imagePath: 'assets/images/background_auth.png',  // path to your image asset
  ),
];
