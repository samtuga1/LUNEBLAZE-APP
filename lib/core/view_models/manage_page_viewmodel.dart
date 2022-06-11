import 'package:luneblaze_app/models/institute_model.dart';
import 'package:luneblaze_app/models/organization_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ManagePageViewModel extends BaseViewModel {
  final _navigation = NavigationService();
  bool loading = false;

  Future<void> fakeDelay() async {
    loading = true;
    Future.delayed(Duration(milliseconds: 900), () {
      loading = false;
      notifyListeners();
    });
  }

  bool viewInstitutes = false;
  bool viewOrganisation = false;
  void viewInstitutesPressed() {
    viewInstitutes = !viewInstitutes;
    notifyListeners();
  }

  List<InstituteModel> institutions = [
    InstituteModel(
      title: 'js Bose faridabad',
      subtitle: 'Don\'t know shdudid',
    ),
    InstituteModel(
      title: 'Test colledge',
    ),
    InstituteModel(
      title: 'Learning Institute',
      subtitle: 'Testing on the application',
    ),
  ];

  List<OrganizationModel> organization = [
    OrganizationModel(
      title: 'Awakin',
      subtitle: 'Learn to code',
    ),
    OrganizationModel(
      title: 'Test is an organization',
    ),
    OrganizationModel(
      title: 'Learning organization',
      subtitle: 'Testing on the application',
    ),
  ];

  void viewviewOrganisationPressed() {
    viewOrganisation = !viewOrganisation;
    notifyListeners();
  }

  void goBack() {
    _navigation.popRepeated(1);
  }
}
