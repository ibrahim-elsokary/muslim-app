abstract class AppStates{}

class AppInitState extends AppStates{}
class AppGetQuranLoadingState extends AppStates{}
class AppGetQuranSuccessState extends AppStates{}
class AppGetQuranErrorState extends AppStates{
  final error;
  AppGetQuranErrorState(this.error);
}

class AppGetLocationLoadingState extends AppStates{}
class AppGetLocationSuccessState extends AppStates{}
class AppGetLocationErrorState extends AppStates{
  final error;
  AppGetLocationErrorState(this.error);
}


class AppCahngeBottomNavState extends AppStates{}

class AppMoreInfoState extends AppStates{}

class AppTimerState extends AppStates{}