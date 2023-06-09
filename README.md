__Language :__ English | [Bahasa Indonesia](README_ID.md)


## Installing
To install this app
- Flutter Version: 3.3.6


```
git clone https://github.com/Rhemi7/adele-remi-techtask-mobile.git
```

And then in terminal install the required dependencies

```
flutter pub get
```
Run the app in the project's root folder of the terminal

```
flutter run 
```

## Running the tests
Open a test file and run test cases in terminal

```
flutter test --no-sound-null-safety
```

## App Development Info
Folder Structure

  - Core: This contains things that were reused throughout the project.
  - Feature: This is where every major feature in the project is located.
     - data: all calls made to the remote data/api are included here.
     - domain: represents bridge between the data layer and presentation layer, here all abstractions are made before being sent to the presentation layer
     - presentation: includes all classes and methods that make up the screens/pages of the app.
     
     
 ## Plugins
| Name | Description |
| --- | --- |
| Hooks Riverpod | Used for state management |
| Get it | Dependency Injection |
| Dartz | Functional programming in Dart |
| Mockito | Used for testing |
| Http | Used for making network requests|
| Equatable | used for showing equality between objects |
| Date format | Used to format date |

 ## Screenshots
 
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-03-31 at 08 15 58](https://user-images.githubusercontent.com/54381642/229065165-f1131ab7-1e44-406c-b4e8-529edb7b76c4.png)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-03-31 at 08 16 05](https://user-images.githubusercontent.com/54381642/229065186-fd7c2695-57c7-43ad-93d3-a2dfa6abd9ac.png)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-03-31 at 08 16 30](https://user-images.githubusercontent.com/54381642/229065221-7cb8273a-e7a4-44b8-b955-50a15cc2e1ca.png)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-03-31 at 08 17 29](https://user-images.githubusercontent.com/54381642/229065270-872a8cd1-331b-400f-9896-cd90dd3fb816.png)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-03-31 at 08 16 38](https://user-images.githubusercontent.com/54381642/229065313-17e688bc-c061-406b-beb7-144001464fa9.png)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-03-31 at 08 16 44](https://user-images.githubusercontent.com/54381642/229065344-bb2302ba-440e-401b-bf5e-d02c4a562f5b.png)


# Mobile Technical Task
Apps for Lunch Recipes Suggestion

## Time Management
There is no deadline to do this tech task. It's up to you how you manage your time to accomplish at least the requirements.

## Assessment

Our assessment criteria will pay attention to:
- How the application is structured, and files are organised.
- Code quality (Clean code).
- The quality of test cases in your test suite.
- Interpretation of the problem.
- Use of `git`.
- Implementation and final execution.
- Commits, as this will allow us to understand some of the decisions you make throughout the process.

## User Story
As a User, I would like to get a set of recipes what I can have for lunch today based on the contents of my fridge so that I can quickly decide what I'll be having.

__Acceptance Criteria__
- Given that I have started the app, I should input my preference lunch date, or it would be today date if it is empty
- Given that I have made a request to the `/ingredients` endpoint, I should receive a `JSON` response of the ingredients in my fridge.
- Given that I get the options of my ingredients, I should choose some ingredients to get the recipes.
- Given that an ingredient is past its `use-by` date (inclusive), I should not be able to choose that ingredient.
- Given that I have chosen some ingredients, I should request to the `/recipes` endpoint with
 `?ingredients=<title-1>,<title-2>,<title-n>` as a query parameter.
- Given that I get the result of the available recipes, I should see a list of the recipes as well as the ingredients to make per recipes.

__Additional Criteria__
- Fork this Flutter project as a base for your project.
- The application MUST have more than one screen and navigation.
- The application MUST contain unit / widget tests (e.g. using the `flutter_test` package).
- The application MUST be completed using an `OOP` approach.
- Any dependencies MUST be installed using dependency management tools (`Pub` for Flutter).
- Any installation, build steps, testing and usage instructions MUST be provided in a `README.md`
file in the root of the application. __Do not use a autogenerated file__

## Framework
Use the [__Flutter__](https://flutter.dev/docs/get-started/codelab) framework.  

## API Endpoint
__Documentation__

https://documenter.getpostman.com/view/9359572/SW17TFmK

__Mock Base URL__

https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev

__Instruction__
1. Use `/ingredients` to get all of my ingredients on my fridge
2. Use `/recipes?ingredients=<title-1>,<title-n>` to get recipes based on the preferred ingredients title

__NOTES : This API is only a mock server to simulate the request and response body. So the result of the API does not affect your final result.__ 
 
## Submission
The application should be committed to a `public` repository on `GitHub` or `BitBucket` (`<lastname>-<firstname>-techtask-mobile`) and simply send us a link to the repository.

## Getting Started with Flutter

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.
