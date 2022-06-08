import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetNotifiedViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  // ignore: non_constant_identifier_names
  List<String> course_choice_options = ['Tech', 'BBA', 'BCA', 'Bcom'];
  // ignore: non_constant_identifier_names
  String? selected_course;

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
  String? selected_study_option;

  void selectStudyOption(String value) {
    selected_study_option = value;
    notifyListeners();
  }

  List<String> year_passing_options = ['2022', '2021', '2020', '2019'];
  String? selected_passing_year;

  void selectYearOfPass(String value) {
    selected_passing_year = value;
    notifyListeners();
  }

  List<String> percentage_choice_options = ['>40', '>50', '>60', '>70'];
  String? selected_percentage_choice;

  void selectpercentageOption(String value) {
    selected_percentage_choice = value;
    notifyListeners();
  }

  List<String> starting_year_options = ['2022', '2021', '2020', '2019'];
  String? selected_starting_year_option;

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

  void doneClicked() {
    // Done is clicked
  }
}
