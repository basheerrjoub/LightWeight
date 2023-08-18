class Exercise {
  final String eid;
  final String name;
  final String type;            // e.g., 'Cardio', 'Strength', 'Flexibility'
  final String description;     // A brief description of the exercise
  final int sets;
  final int repetitions;
  final String intensity;       // e.g., 'Low', 'Medium', 'High'
  final String image;


  // Constructor
  const Exercise({
    required this.eid,
    required this.name,
    required this.type,
    required this.description,
    required this.sets,
    required this.repetitions,
    required this.intensity,
    required this.image,
  });

  // A method to fetch a brief overview of the exercise for display purposes
  String getOverview() {
    return "Exercise: $name\nType: $type\nIntensity: $intensity";
  }


}
