import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BlockedUsersViewModel extends BaseViewModel {
  final _navigate = NavigationService();
  //Initially empty blocked users
  List? blockedUser = [];
  void goBack() {
    _navigate.popRepeated(1);
  }
}
