
import 'Meal.dart';

List<Meal> mealList = [
  Meal(
    id: '1',
    name: 'PUMPED-UP PROTEIN PANCAKE',
    description: 'We eat with our eyes first, and at just 300 calories this giant, protein-packed pancake will fill an entire plate and help crush those morning hunger pangs! The egg whites help boost the protein to 30g per serving, while the coconut flour and oats add fiber to help keep you full.',
    imageUrl: 'assets/images/meals/meal1.jpg',
    calories: 300,
    protein: 30,
    carbs: 36,
    fat: 3.7,
    ingredients: [
      '1 cup liquid egg whites',
      '1⁄2 cup old-fashioned oats',
      '1 tbsp coconut flour',
      '1⁄2 tsp ground cinnamon',
      '1⁄2 tsp baking powder',
      '2 tbsp no-calorie pancake syrup (optional)',
    ],
    steps: [
      'In a medium bowl, combine the egg whites, oats, coconut flour, cinnamon, and baking powder. Mix well, and allow to thicken for 5 to 10 minutes.',
      'Spray a medium skillet with non-stick cooking spray and preheat over medium heat.',
      'Add the batter to the hot pan, cover, and cook for 10 to 12 minutes. Move cooked pancake to a plate.',
      'Drizzle with the syrup (if using). Serve warm.'
    ],
  ),
  Meal(
    id: '2',
    name: 'PUMPKIN PIE BOWL',
    description: 'Creamy, spicy, a little crunchy—and ready in less than an hour! This dish has the flavors of fall, the feel of comfort food, and the protein you need to get your day going. The fiber in the pumpkin, mixed with the slower-digesting protein in Greek yogurt will help you feel full for longer.',
    imageUrl: 'assets/images/meals/meal2.jpg',
    calories: 266,
    protein: 25.7,
    carbs: 30.9,
    fat: 5.9,
    ingredients: [
      '1 6oz (170g) container plain 2% Greek yogurt',
      '1⁄2 cup canned pumpkin purée (not pumpkin pie mix)',
      '1⁄2 tsp powdered stevia',
      '1⁄2 tsp ground cinnamon',
      '1⁄2 tsp ground ginger',
      '1⁄4 cup puffed brown rice cereal',
      '1⁄4 cup fresh strawberries, thinly sliced',
    ],
    steps: [
      'In a medium bowl, combine the Greek yogurt, pumpkin purée, stevia, cinnamon, and ginger. Mix well to combine.',
      'Top with the brown rice cereal and strawberry slices. Cover tightly with plastic wrap and place in the refrigerator to chill for at least 30 minutes before serving.'
    ],
  ),

  Meal(
    id: '3',  // provide a unique identifier for this meal
    name: 'OVERNIGHT MOCHA OATS',
    description: 'Breakfast is an essential meal for maintaining a healthy body weight. These oats offer complex carbohydrates and fiber to keep you full and energize your mornings. Chia seeds promote satiety, and coffee will boost metabolism and give you a spark of energy to get your day going.',
    imageUrl: 'assets/images/meals/meal3.jpg',
    calories: 300,
    protein: 24.2,
    carbs: 43,
    fat: 5.7,
    ingredients: [
      '1⁄2 cup old-fashioned rolled oats',
      '1 tbsp chia seeds',
      '1 tbsp unsweetened cocoa powder',
      '1 tbsp powdered stevia',
      '1⁄2 cup plain nonfat Greek yogurt',
      '1⁄3 cup pasteurized liquid egg whites',
      '1⁄4 cup brewed coffee, cold',
    ],
    steps: [
      'In a 12-ounce (340g) glass jar, combine the oats, chia seeds, cocoa powder, and stevia. Stir well to combine.',
      'Add the Greek yogurt, egg whites, and coffee. Tightly seal the jar and shake until all ingredients are well incorporated.',
      'Refrigerate for a minimum of 8 hours to allow the oats to soften. Serve chilled.'
    ],
  ),
  Meal(
    id: '4',  // provide a unique identifier for this meal
    name: 'COTTAGE CHEESE AND CANTALOUPE BOWL',
    description: 'Sweet, juicy cantaloupe is the vessel for this protein-packed treat. Cottage cheese adds creaminess and contains casein, which helps make it a slower digesting protein. Slivered almonds add crunch and healthy fats, while warming cinnamon helps regulate blood sugar levels.',
    imageUrl: 'assets/images/meals/meal4.jpg',
    calories: 314,
    protein: 32,
    carbs: 32,
    fat: 6.7,
    ingredients: [
      '1 small cantaloupe',
      '2 cups 1% cottage cheese',
      '2 tbsp slivered almonds',
      '1⁄8 tsp ground cinnamon',
    ],
    steps: [
      'To create the bowls, slice the cantaloupe in half crosswise, and use a spoon to scoop out the seeds of each half.',
      'Add 1 cup cottage cheese to each cantaloupe bowl and top each with 1 tbsp slivered almonds and a pinch of cinnamon. Serve immediately.'
    ],
  ),
  Meal(
    id: '5',  // provide a unique identifier for this meal
    name: 'BLUEBERRY MUFFINS',
    description: 'Store-bought muffins may be convenient, but they’re loaded with fat and sugar. This simple version pumps up the protein, while giving you the goodness of whole-grain oats and antioxidant-rich blueberries. A touch of butter gives just enough flavor and moisture to make these muffins feel like a treat!',
    imageUrl: 'assets/images/meals/meal5.jpg',
    calories: 135,  // since you didn't provide calorie information, you might want to set a default or add it later
    protein: 8.7,  // same comment as for calories
    carbs: 14.1,    // same comment as for calories
    fat: 5.2,      // same comment as for calories
    ingredients: [
      '1 cup old-fashioned rolled oats',
      '2⁄3 cup gluten-free or all-purpose flour',
      '1⁄2 cup vanilla whey protein powder',
      '1 tsp ground cinnamon',
      '1 tsp baking powder',
      '1 tsp baking soda',
      '1⁄4 cup powdered stevia',
      '1⁄3 cup liquid egg whites',
      '1 cup unsweetened applesauce (preferably cinnamon flavored)',
      '1⁄4 cup butter, softened',
      '3⁄4 cup unsweetened almond milk',
      '1 tsp vanilla extract',
      '1 cup fresh blueberries'
    ],
    steps: [
      'Preheat the oven to 400°F (204°C). Spray a large muffin tin with non-stick cooking spray.',
      'In a large bowl, combine the oats, flour, protein powder, cinnamon, baking powder, baking soda, and stevia. Mix well.',
      'In a separate medium bowl, combine the egg whites, applesauce, butter, almond milk, and vanilla extract. Mix well.',
      'Make the batter by adding the wet ingredients to the dry ingredients, and mixing until the ingredients are just incorporated. Gently fold in the blueberries, being careful not to crush them. Fill each muffin tin cup to two-thirds full with the batter.',
      'Bake for 20 to 25 minutes, or until a toothpick inserted into the middle comes out clean. Serve warm.'
    ],
  ),
  Meal(
    id: '6',
    name: 'STEAK AND EGG BURRITO',
    description: 'This low carb burrito features an egg wrap, instead of a tortilla, and is perfect for a quick, on-the-go breakfast. Patience in cooking the egg is the key to creating a perfect wrap. Top with any lean protein and a scoop of salsa, and you’ll have a protein-packed breakfast in minutes!',
    imageUrl: 'assets/images/meals/meal6.jpg',
    calories: 276,
    protein: 26.5,
    carbs: 3.0,
    fat: 16.2,
    ingredients: [
      '2 extra large eggs',
      'Pinch of salt',
      'Pinch of ground black pepper',
      '2oz (55g) flank steak, thinly sliced',
      'Pinch of garlic powder',
      '1 tbsp salsa'
    ],
    steps: [
      'Spray a medium skillet with non-stick cooking spray. In a medium bowl, combine the eggs, pinch of salt, and pinch of black pepper. Whisk until the ingredients are well combined.',
      'Add the eggs to the skillet and cook over medium-high heat for 4 to 5 minutes, or until the edges are set. Using a spatula, carefully flip the eggs and cook for an additional 3 to 4 minutes, or until the eggs are fully set. Remove the wrap from the skillet and place on a plate.',
      'Add the flank steak to the skillet, season with salt, black pepper, and garlic powder, and cook for 2 to 3 minutes, or until the steak is well done.',
      'Top the egg wrap with the steak and salsa, and gently fold the edges in to form a burrito. Serve warm.'
    ],
  ),
  Meal(
    id: '7',  // provide a unique identifier for this meal
    name: 'STUFFED FLORENTINE CHICKEN BREASTS',
    description: 'It’s time to stop eating the same boring chicken recipes! Searing the chicken breasts in this dish helps seal in the juices, and the spinach, sun-dried tomatoes, and gooey mozzarella all burst with flavor. At less than 200 calories per serving, this recipe is a muscle-making winner!',
    imageUrl: 'assets/images/meals/meal7.jpg',
    calories: 193,
    protein: 30.0,
    carbs: 7.0,
    fat: 5.0,
    ingredients: [
      '3 boneless, skinless chicken breasts, or approximately 1lb (450g)',
      '1 ⁄ 2 tsp salt',
      '1 ⁄ 2 tsp ground black pepper',
      '1 ⁄ 2 tsp garlic powder',
      '1 ⁄ 2 cup chopped sun-dried tomatoes',
      '1 ⁄ 2 cup chopped fresh baby spinach',
      '1 ⁄ 2 cup light shredded mozzarella cheese'
    ],
    steps: [
      'Preheat oven to 350°F (177°C). Lightly spray a medium cast iron skillet with non-stick cooking spray and place over medium-high heat.',
      'Add the chicken breasts to the skillet and season with the salt, pepper, and garlic powder. Cook for 1 to 2 minutes per side, or until lightly browned.',
      'Remove the skillet from the heat and allow the breasts to rest in the skillet for 5 minutes. Once the breasts are cool enough to handle, transfer to a cutting board and create pockets for the fillings by slicing halfway through each breast lengthwise, being careful not to slice completely through the breasts.',
      'Stuff each breast with equal amounts of the spinach, tomatoes, and cheese, and secure by inserting a toothpick through each breast. Transfer the breasts back to the skillet and bake for 20 minutes. The chicken is done when the juices run clear and the internal temperature reaches 165°F (74°C). Serve hot.'
    ],
  ),
  Meal(
    id: '8',
    name: 'BISON AND PORTOBELLO SLIDERS',
    description: 'Lean ground bison lends richness to these bite-sized burgers, and Portobello buns add rich flavor without adding loads of carbs. Dried onion flakes help bind the patties so they’re easier to shape, flip, and serve, and the egg whites add more protein and help keep the burgers juicy.',
    imageUrl: 'assets/images/meals/meal8.jpg',
    calories: 212,
    protein: 27.0,
    carbs: 9.1,
    fat: 9.0,
    ingredients: [
      '1lb (450g) lean ground bison, preferably 92/8 lean-to-fat ratio',
      '1 ⁄ 4 cup liquid egg whites',
      '2 tbsp dried onion flakes',
      '1 tsp garlic powder',
      '1 ⁄ 2 tsp salt',
      '1 ⁄ 2 tsp ground black pepper',
      '4 tbsp no-sugar-added ketchup (optional)',
      '8 large portobello mushrooms',
      '1 ⁄ 2 tsp salt',
      '1 ⁄ 2 tsp ground black pepper',
      '1 ⁄ 2 tsp garlic powder'
    ],
    steps: [
      'Preheat the grill to medium. In a large bowl, combine the ground bison, egg whites, onion flakes, garlic powder, salt, and black pepper. Mix until the ingredients are well incorporated. With wet hands, shape the mixture into 8 even-sized patties. Set aside.',
      'Rinse the mushrooms and pat dry with a paper towel. Remove the stems and place on a flat surface, gill-sides up. Season with the salt, black pepper, and garlic powder.',
      'Place the mushrooms on the grill, gill-sides up, and grill for 3 minutes. Flip and grill for an additional 2 to 3 minutes. Transfer to a paper towel to drain, gill-sides down.',
      'Place the bison patties on the grill, and cook for 4 to 5 minutes per side. Transfer to a plate and allow to rest for 5 minutes. Assemble the sliders by placing a bison patty between two portobello buns. Top each slider with 1 tbsp ketchup (if using). Serve warm.'
    ],
  ),
  Meal(
    id: '9',
    name: 'CHILI LIME SALMON POUCHES',
    description: 'Lime adds wonderful vibrancy and a gorgeous touch of color to this dish. Chili and cilantro pair perfectly with the buttery flavor of the salmon, which is high in protein and rich in omega-3 fatty acids, which have numerous health benefits. Parchment paper makes prep and clean up easy.',
    imageUrl: 'assets/images/meals/meal9.jpg',
    calories: 165,
    protein: 25.0,
    carbs: 0.0,
    fat: 7.2,
    ingredients: [
      '1 medium wild salmon filet, approximately 1lb (450g)',
      '2 large limes, sliced into 1 ⁄ 4 -inch (.5cm) slices (reserve 1 ⁄ 3 of each lime)',
      '2 tsp chili powder',
      '1 ⁄ 2 tsp salt',
      '1 tsp ground cilantro',
    ],
    steps: [
      'Preheat the oven to 400°F (204°C). Cut a piece of parchment paper large enough to create a pouch for the salmon. Place the parchment on a large baking sheet.',
      'Arrange enough lime slices on the parchment paper to create a bed for the salmon filet. Place the filet, scales-side-down, on top of the lime slices.',
      'Squeeze the reserved lime over the filet, discard. Season the filet with the chili powder, salt, and cilantro. Place the remaining lime slices on top of the filet.',
      'Fold the parchment paper over the salmon and crimp the edges to form a pouch. Bake for 15 minutes. Serve hot.',
    ],
  ),
  Meal(
    id: '10',
    name: 'APPLE-ROASTED WHOLE CHICKEN',
    description: 'Turning up the heat during the last 15 minutes of baking helps seal in the juices and crisp the skin to produce this photo-worthy bird. Most meal plans will call for a 50/50 serving of breast and thighs, with the skin removed. Keto plan followers can have the crispy skin and dark meat.',
    imageUrl: 'assets/images/meals/meal10.jpg',
    calories: 151,
    protein: 26.4,
    carbs: 0.0,
    fat: 4.2,
    ingredients: [
      '1 tsp salt',
      '1 tsp garlic powder',
      '1 tsp ground black pepper',
      '1 small chicken, approximately 2 1 ⁄ 2 to 3lbs (1.2 to 1.4kg), giblets removed',
      '1 medium Granny Smith apple',
      'Coconut oil cooking spray',
    ],
    steps: [
      'Preheat the oven to 350°F (177°C). Make the rub by combining the salt, garlic powder, and black pepper in a small bowl.',
      'Place the chicken in a large roasting pan. Insert the apple into the cavity, and season the outside of the chicken with half of the rub. Place the chicken in the oven and roast for 45 minutes.',
      'After 45 minutes, increase the oven temperature to 400°F (204°C). Remove the chicken from the oven, lightly spray with coconut oil spray, and season with the remaining rub.',
      'Bake for an additional 15 minutes, or until the internal temperature reaches 165°F (74°C) and the juices run clear when the chicken is pierced with a sharp knife. Slice and serve hot.',
    ],
  ),
  Meal(
    id: '11',
    name: 'SRIRACHA CURRY COCONUT CHICKEN',
    description: 'This bold dish is full of flavor and is made with simple, everyday ingredients. Steaming the chicken locks in the flavor and keeps it sumptuously juicy. Sriracha and coconut milk balance the smooth and spicy flavors, and aromatic curry adds warmth and contains beneficial antioxidant compounds.',
    imageUrl: 'assets/images/meals/meal11.jpg',
    calories: 159,
    protein: 25.4,
    carbs: 2.6,
    fat: 4.8,
    ingredients: [
      '1 cup light coconut milk',
      '1 ⁄ 2 cup sriracha hot chili sauce',
      '1 tbsp lime juice',
      '1 tbsp curry powder (Vindaloo is preferred)',
      '1 ⁄ 2 tsp salt',
      '1 ⁄ 2 tsp ground black pepper',
      '2lbs (900g) boneless, skinless chicken breasts',
    ],
    steps: [
      'In a large bowl, combine the coconut milk, sriracha sauce, lime juice, curry powder, salt, and black pepper. Mix well. Add the chicken breasts to the bowl, and toss thoroughly to coat the chicken with the sauce.',
      'Spray a medium skillet with non-stick cooking spray and place over medium heat. Add the chicken breasts and cook for 1 to 2 minutes per side, or until the chicken begins to brown.',
      'Add the sauce to the skillet, cover, and cook for an additional 10 minutes, flipping the chicken breasts halfway through the cooking time.',
      'Adjust the heat to medium-high, uncover, and cook the breasts for an additional 2 to 3 minutes per side, or until the sauce begins to caramelize. The chicken is done when the internal temperature reaches 160°F (71°C) and the juices run clear. Serve hot.',
    ],
  ),
  Meal(
    id: '12',
    name: 'BROILED COD WITH CHARRED TOMATILLO SALSA',
    description: 'This quick and easy entrée features lightly seasoned cod and a tart and citrusy charred tomatillo salsa. Serrano chiles deliver a punch of heat and nice burst of flavor. Earthy cilantro, onions, and lime all add bright flavors to complement this mild and meaty fish.',
    imageUrl: 'assets/images/meals/meal12.jpg',
    calories: 137,
    protein: 25.9,
    carbs: 3.6,
    fat: 1.3,
    ingredients: [
      '5 large tomatillos, stems and husks removed',
      '2 serrano chiles, stems and seeds removed, chopped',
      '2 tbsp diced white onion',
      '1 ⁄ 4 cup roughly chopped fresh cilantro',
      '1 ⁄ 2 tsp lime juice',
      '1 ⁄ 2 tsp salt',
      '1 ⁄ 2 lb (225g) cod fillets (fresh or frozen)',
      '1 ⁄ 2 tsp garlic powder',
      '1 ⁄ 2 tsp salt',
      '1 ⁄ 2 tsp ground black pepper',
    ],
    steps: [
      'Preheat the broiler to low. Line a small baking pan with aluminum foil and place the tomatillos and serrano chiles in the pan. Place the pan on the top oven rack and roast for 6 to 8 minutes, flipping the tomatillos and chiles halfway through the cooking process. Roast until nicely charred.',
      'Add the tomatillos, chiles, onion, cilantro, lime juice, and salt to a blender. Pulse in 10 second intervals until a smooth consistency is achieved. Set aside.',
      'Spray a small baking pan with non-stick cooking spray. Place the cod in the pan and season with the garlic powder, salt, and black pepper. Broil for 3 to 4 minutes per side, until the fish is lightly browned and can be flaked with a fork.',
      'Transfer the baked cod to a serving platter and spoon the tomatillo salsa over top. Serve hot.',
    ],
  ),
  Meal(
    id: 'unique_id_for_chicken_hobo_dinner',
    name: 'CHICKEN HOBO DINNER',
    description: 'Cut down on prep time with this easy dinner that’s ready in less than 45 minutes. Sweet bell peppers and onions provide an antioxidant boost and season the chicken as it cooks. The cooking process steams the veggies and seals in the flavors in this lighter version of a campfire favorite.',
    imageUrl: 'assets/images/meals/meal13.jpg',
    calories: 173,
    protein: 26.9,
    carbs: 8.3,
    fat: 3.0,
    ingredients: [
      '1lb (450g) boneless, skinless chicken breasts, cut into 1-inch (2.5cm) strips',
      '2 large bell peppers, ribs and seeds removed, sliced into 1 ⁄ 2 -inch (1.25cm) strips',
      '1 red onion, sliced crosswise and into 1 ⁄ 2 -inch (1.25cm) slices',
      '1 tsp chili powder',
      '1 tsp ground cumin',
      '1 tsp garlic powder',
      '1 tsp salt',
    ],
    steps: [
      'Preheat the oven to 400°F (204°C). Lightly spray four 12 x 12in (30 x 30cm) squares of aluminum foil with non-stick cooking spray. In a large bowl, combine the chicken strips, peppers, and onions. Set aside.',
      'Make the seasoning mix by combining the chili powder, cumin, garlic powder, and salt in a small bowl. Mix well.',
      'Add the seasoning mix to the chicken, peppers, and onions. Toss thoroughly to coat the chicken and peppers with the seasoning.',
      'Place equal amounts of the chicken, peppers, and onions onto each foil square. Grasp the corners of the squares, gather the edges at the middle, and crimp tightly together to form pouches.',
      'Place the pouches on a large baking sheet and bake for 23 to 25 minutes, or until the juices from the chicken run clear and the internal temperature reaches 165°F (74°C).',
      'Remove the pouches from the oven and allow to cool for 10 minutes before serving. (Use caution when opening the pouches, as the steam will be very hot.)',
    ],
  )


];