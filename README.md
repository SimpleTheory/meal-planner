# Meal Planner

Welcome to the Meal Planner repository! This is a tool designed to help you plan your meals efficiently, save time, and make healthier eating choices. Whether you're an individual, a family, or a meal-prepping enthusiast, this repository provides you with the necessary resources to organize your meals and create personalized meal plans.

## Features

- **Meal Planning**: Plan your meals for the week or any desired duration. Specify breakfast, lunch, dinner, and snacks for each day.
- **Recipe Collection**: Build your recipe library by adding your favorite recipes with ingredients, instructions, and images.
- **Ingredient Management**: Create a centralized ingredient list from your meal plans and recipes, making grocery shopping easier.
- **Shopping List**: Generate a comprehensive shopping list based on your selected meal plans and recipes.
- **Nutritional Information**: Access nutritional information for your recipes to track calorie intake, macronutrients, and more.

## Installation

### From release:
Download the apk from the releases tab on this repo to your android phone and install.

### Build from source:
This is a flutter project, in order to compile it you must have flutter/dart installed.
To set up the Meal Planner locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/SimpleTheory/meal-planner.git
   ```

2. Change to the project directory:

   ```bash
   cd meal-planner
   ```

3. Install the required dependencies:

   ```bash
   flutter pub get
   ```

4. Complile the application:

   ```bash
   flutter build apk --release
   ```
5. When the compilation finishes, the application should now be located here:
   `build/app/outputs/flutter-apk/app-release.apk`

6. Send the file to your phone, click it and install.

## Usage

Once you have the Meal Planner up and running, you can start using it to plan your meals. Here's a quick overview of the main features and how to use them:

1. **Sign up or log in**: Many of this app's functions are a wrapper for the nutritionix API. On the app's first launch you will be prompted for an API key and an API ID. In order to get these click the sign up to nutritionix button. That will navigate you to there website where you can make a free account (no payment methods needed).

2. **Add ingredients**: Add ingredients to use for any recipe by typing them in, scanning their barcode or creating them from scratch.

3. **Manage your recipes**: Access the recipe collection section to manage your recipes. Add new recipes, edit existing ones, and include details such as ingredients, instructions, and images.

4. **Customize your preferences**: Customize your DRIS for each of your diets.

5. **Generate a shopping list**: Once your meal plan is ready, generate a shopping list based on the selected meals. Review the list and make any necessary adjustments before heading to the grocery store.

6. **Access nutritional information**: Track your nutritional intake by viewing the nutritional information for each recipe. As well as tracking your nutrients for each day of a diet and get the greater picture by monitoring calories, macronutrients, vitamins, and more through the average day breakdown.

For more detailed information, refer to the documentation included in the repository.

## Contributing

Contributions to the Meal Planner are welcome! If you have any suggestions, bug reports, or feature requests, please submit them as issues on the GitHub repository. Additionally, if you would like to contribute code, please open a pull request following the guidelines outlined in the repository.
