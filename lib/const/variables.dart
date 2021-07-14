class Global {
  Global._privateConstructor();

  static final Global _instance = Global._privateConstructor();

  factory Global() {
    return _instance;
  }

  bool isInvestor = false;

  String uid = '';
  String name = '';
  String email = '';
  String leagueRank = '';
  int leaguePoints = 0;

  var loginUser;
}
