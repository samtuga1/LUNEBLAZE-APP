import 'dart:developer';

import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:luneblaze_app/core/services/api_services.dart';

class GetNotifiedViewModel extends BaseViewModel {
  bool loading = false;
  final _navigation = locator<NavigationService>();
  // ignore: non_constant_identifier_names
  List<String> course_choice_options = ['Tech', 'BBA', 'BCA', 'Bcom'];
  // ignore: non_constant_identifier_names
  String selected_course = 'Tech';

  Future<void> doneClicked() async {
    loading = true;
    notifyListeners();
    try {
      final response = await api_services.create().postReportsAndContactUsData({
        'userid': '3',
        'type': 'user',
        'venue': '0',
        'field_of_study': selected_study_option,
        'course': selected_course,
        'skills': '',
        'yearofstart': selected_starting_year_option,
        'yearofpassing': selected_passing_year,
        'percentage': selected_percentage_choice,
        'notify_intern': internshipSwitch ? '1' : '0',
        'notify_drive': jobSwitch ? '1' : '0',
      });
      log(
        response.statusCode.toString(),
      );
      loading = false;
      notifyListeners();
    } catch (error) {
      loading = false;
      notifyListeners();
      log(error.toString());
      // Handling of exceptions
    }
  }

  void selectCourseOption(String value) {
    selected_course = value;
    notifyListeners();
  }

  List<String> study_choice_options = [
    'Computer',
    'Electronics',
    'Physics',
    'Electrical'
  ];
  String selected_study_option = 'Computer';

  void selectStudyOption(String value) {
    selected_study_option = value;
    notifyListeners();
  }

  List<String> year_passing_options = ['2022', '2021', '2020', '2019'];
  String selected_passing_year = '2022';

  void selectYearOfPass(String value) {
    selected_passing_year = value;
    notifyListeners();
  }

  List<String> percentage_choice_options = ['>40', '>50', '>60', '>70'];
  String selected_percentage_choice = '>40';

  void selectpercentageOption(String value) {
    selected_percentage_choice = value;
    notifyListeners();
  }

  List<String> starting_year_options = ['2022', '2021', '2020', '2019'];
  String selected_starting_year_option = '2019';

  void selectStartingYearOption(String value) {
    selected_starting_year_option = value;
    notifyListeners();
  }

  void goBack() => _navigation.popRepeated(1);

  bool internshipSwitch = false;
  bool jobSwitch = false;
  // Switching for internship
  void switchInternshipMode(bool switchValue) {
    internshipSwitch = switchValue;
    notifyListeners();
  }

// Switching for job mode
  void switchJobMode(bool switchValue) {
    jobSwitch = switchValue;
    notifyListeners();
  }
}
