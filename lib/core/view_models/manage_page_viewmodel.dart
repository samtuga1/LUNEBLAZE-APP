import 'dart:developer';
import 'package:luneblaze_app/core/services/api_services.dart';
import 'package:luneblaze_app/models/institute_model.dart';
import 'package:luneblaze_app/models/organization_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ManagePageViewModel extends BaseViewModel {
  final _navigation = NavigationService();
  bool loading = false;

  bool viewInstitutes = false;
  bool viewOrganisation = false;
  void viewInstitutesPressed() {
    viewInstitutes = !viewInstitutes;
    notifyListeners();
  }

  List<InstituteModel> institutions = [];

  List<OrganizationModel> organizations = [];

  Future<void> fetch_organizations() async {
    try {
      final response = await api_services.create().postOrganizationsVenuesData({
        'userId': '3',
      });
      List organizationList =
          response.body['data']['organisation_data'].toList();
      organizationList.forEach((organization) {
        organizations.add(OrganizationModel(
          title: organization['Name'],
          subtitle: organization['Description'],
          logo: organization['Logo'],
        ));
      });
    } catch (error) {
      log(error.toString());
    }
    notifyListeners();
  }

  Future<void> fetch_institutions() async {
    try {
      final response = await api_services.create().postOrganizationsVenuesData({
        'userId': '3',
      });
      List institutionsList = response.body['data']['venue'].toList();
      institutionsList.forEach((institution) {
        institutions.add(InstituteModel(
          title: institution['venue_name'],
          subtitle: institution['description'],
          logo: institution['logo'],
        ));
      });
    } catch (error) {
      log(error.toString());
    }
    notifyListeners();
  }

  Future<void> make_all_fetching() async {
    loading = true;
    await Future.wait([
      fetch_institutions(),
      fetch_organizations(),
    ]);

    loading = false;
    notifyListeners();
  }

  void viewviewOrganisationPressed() {
    viewOrganisation = !viewOrganisation;
    notifyListeners();
  }

  void goBack() {
    _navigation.popRepeated(1);
  }
}
