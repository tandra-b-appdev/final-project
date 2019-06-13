namespace :dummy do
  desc "Hydrate the database with some dummy data to make it easier to develop"
  task :reset => :environment do
    
    Recipe.destroy_all
    Recipe.create!([
      {id: 1, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://damndelicious.net/2014/06/21/baked-parmesan-zucchini/", name: "Baked Parmesan Zucchini", user_id: 221284},
      {id: 2, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://cookieandkate.com/perfect-roasted-asparagus-recipe/", name: "Perfect Roasted Asparagus", user_id:221284},
      {id: 3, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://www.foodnetwork.com/recipes/valerie-bertinelli/sauteed-spinach-and-mushrooms-3523982", name: "Sauteed Spinach and Mushrooms", user_id: 221284},
      {id: 4, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://www.cookingchanneltv.com/recipes/quick-roasted-carrots-and-cauliflower-with-walnuts-2109861", name: "Quick Roasted Carrots and Cauliflower with Walnuts", user_id: 221284},
      {id: 5, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://www.acedarspoon.com/turmeric-roasted-cauliflower/", name: "Turmeric Roasted Cauliflower", user_id: 221284},
      {id: 6, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://www.lecremedelacrumb.com/easy-healthy-baked-lemon-chicken/", name: "Easy Healthy Baked Lemon Chicken", user_id: 221284},
      {id: 7, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://damndelicious.net/2014/04/11/garlic-butter-shrimp/", name: "Garlic Butter Shrimp", user_id: 221284},
      {id: 8, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "http://meljoulwan.com/2011/05/08/paleo-pad-thai/", name: "Paleo Pad Thai", user_id: 170984},
      {id: 9, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://www.spendwithpennies.com/garli-mushrooms/", name: "Sauteed Mushrooms with Garlic", user_id: 170984},
      {id: 10, created_at:"2019-06-01", updated_at:"2019-06-01", source_website: "https://gimmedelicious.com/2017/01/18/low-carb-bell-pepper-tacos/", name: "Bell Pepper Tacos", user_id: 170984}
    ])
    puts "There are #{Recipe.count} recipes in the database"
    
    Ingredient.destroy_all
    Ingredient.create!([
      {id: 1, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Zucchini",category_id: 1},
      {id: 2, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Parmesan",category_id: 2},
      {id: 3, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Dried thyme",category_id: 3},
      {id: 4, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Dried organo",category_id: 3},
      {id: 5, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Dried basil",category_id: 3},
      {id: 6, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Garlic Powder",category_id: 4},
      {id: 7, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Olive Oil",category_id: 5},
      {id: 8, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Fresh Parsley leaves",category_id: 3},
      {id: 9, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Asparagus",category_id: 1},
      {id: 10, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Salt",category_id: 4},
      {id: 11, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Pepper",category_id: 4},
      {id: 12, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Lemon",category_id: 1},
      {id: 13, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Balsamic vinegar",category_id: 6}
    ])
    puts "There are #{Ingredient.count} ingredients in the database"
    
    Category.destroy_all
    Category.create!([
      {id: 1, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Vegetable"},
      {id: 2, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Cheese"},
      {id: 3, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Herb"},
      {id: 4, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Seasoning"},
      {id: 5, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Oil"},
      {id: 6, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Vinegar"},
      {id: 7, created_at:"2019-06-01", updated_at:"2019-06-01", name: "Meat"}
    ])
    puts "There are #{Category.count} categories in the database" 
    
    Item.destroy_all
    Item.create!([
      {id: 1, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "Y", quantity: 4, measurement_units: "count", recipe_id: 1, ingredient_id: 1},
      {id: 2, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "Y", quantity: 0.5, measurement_units: "cup", recipe_id: 1, ingredient_id: 2},
      {id: 3, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0.5, measurement_units: "teaspoon", recipe_id: 1, ingredient_id: 3},
      {id: 4, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0.5, measurement_units: "teaspoon", recipe_id: 1, ingredient_id: 4},
      {id: 5, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0.5, measurement_units: "teaspoon", recipe_id: 1, ingredient_id: 5},
      {id: 6, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0.25, measurement_units: "teaspoon", recipe_id: 1, ingredient_id: 6},
      {id: 7, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 2, measurement_units: "tablespoon", recipe_id: 1, ingredient_id: 7},
      {id: 8, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 2, measurement_units: "tablespoon", recipe_id: 1, ingredient_id: 8},
      {id: 9, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "Y", quantity: 0, measurement_units: "to taste", recipe_id: 1, ingredient_id: 10},
      {id: 10, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "Y", quantity: 0, measurement_units: "to taste", recipe_id: 1, ingredient_id: 11},
      {id: 11, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "Y", quantity: 1, measurement_units: "pound", recipe_id: 2, ingredient_id: 9},
      {id: 12, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 2, measurement_units: "tablespoon", recipe_id: 2, ingredient_id: 7},
      {id: 13, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0, measurement_units: "to taste", recipe_id: 2, ingredient_id: 10},
      {id: 14, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0, measurement_units: "to taste", recipe_id: 2, ingredient_id: 11},
      {id: 15, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 1, measurement_units: "count", recipe_id: 2, ingredient_id: 12},
      {id: 16, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0.25, measurement_units: "cup", recipe_id: 2, ingredient_id: 2},
      {id: 17, created_at:"2019-06-01", updated_at:"2019-06-01", essential_flag: "N", quantity: 0, measurement_units: "to taste", recipe_id: 2, ingredient_id: 13},
    ])
    puts "There are #{Item.count} items in the database" 
  
  end
    
    # Write some Ruby to quickly create some records in your tables.
    # If it's helpful, you can use methods from the Faker gem for random data:
    #   https://github.com/stympy/faker

end
