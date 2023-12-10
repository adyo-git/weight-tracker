# Weight Tracker App

A simple weight tracker app built using Flutter and Firebase
- Weights can be added by tapping the floating action button
- Weights can be edited by tapping an existing weight row
- Weights can be deleted by swiping a weight row to the right

## Getting Started

- This project was built using clean architecture for scalability and maintainability. The layers are:
  - Domain
  - Data layer:
    - Repository (repo)
    - Data Source
  - Presentation
- State management was done using BLOC
- Dependency injection was done using Get It
- The project was implemented using anonymous sign in with a caveat:
  - If you sign out and re-sign, it will login to a different account as the current user is not cached
  - This can ne addressed by saving the user ID to shared preferences for example
- Unit tests are added for data sources and view models

