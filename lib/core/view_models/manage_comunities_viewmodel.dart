import 'package:luneblaze_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ManageCommunitiesViewModel extends BaseViewModel {
  final navigation = NavigationService();
  void goBack() {
    navigation.popRepeated(1);
  }

  bool loading = false;

// Fake loading indication function
  Future<void> fakeDelay() async {
    loading = true;
    Future.delayed(Duration(milliseconds: 900), () {
      loading = false;
      notifyListeners();
    });
  }

  // Navigate to create community
  void createCommunity() {
    navigation.navigateTo(Routes.createCommunityView);
  }
}
