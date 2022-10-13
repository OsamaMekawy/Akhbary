abstract class NewsStates {}

class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetBuisnessSuccessState extends NewsStates{}
class NewsGetBuisnesslodiningState extends NewsStates{}
class NewsGetBuisnessErorrState extends NewsStates{
  final String erorr;

  NewsGetBuisnessErorrState(this.erorr);
}


class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportslodiningState extends NewsStates{}
class NewsGetSportsErorrState extends NewsStates{
  final String erorr;

  NewsGetSportsErorrState(this.erorr);
}


class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetSciencelodiningState extends NewsStates{}
class NewsGetScienceErorrState extends NewsStates{
  final String erorr;

  NewsGetScienceErorrState(this.erorr);
}