import '../model/user.dart';

class LeaderboardService {
  static final List<User> _users = [];

  static void addUser(User user) {
    _users.add(user);
  }

  static List<User> getUsers() {
    _users.sort((a, b) => b.score.compareTo(a.score));
    return _users;
  }
}