abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppUserLoadedState extends AppStates {
  bool isSignedIn;
  AppUserLoadedState(this.isSignedIn);
}
