import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetNotifiedViewModel extends BaseViewModel { 
  final _navigation = locator<NavigationService>();
  List<String> course_choice_options = ['Tech', 'BBA', 'BCA', 'Bcom'];

  void selectCourseOption(String value) {
    course_choice_options[0] = value;
    notifyListeners();
  }

  List<String> study_choice_options = [
    'Computer',
    'Electronics',
    'Physics',
    'Electrical'
  ];

  void selectStudyOption(String value) {
    study_choice_options[0] = value;
    notifyListeners();
  }

  List<String> year_passing_options = ['2022', '2021', '2020', '2019'];

  void selectYearOfPass(String value) {
    year_passing_options[0] = value;
    notifyListeners();
  }

  List<String> percentage_choice_options = ['>40', '>50', '>60', '>70'];

  void selectpercentageOption(String value) {
    percentage_choice_options[0] = value;
    notifyListeners();
  }

  List<String> starting_year_options = ['2022', '2021', '2020', '2019'];

  void selectStartingYearOption(String value) {
    starting_year_options[0] = value;
    notifyListeners();
  }

  void goBack() => _navigation.popRepeated(1);

  bool internshipSwitch = false;
  bool jobSwitch = false;
  void switchInternshipMode(bool switchValue) {
    internshipSwitch = switchValue;
    notifyListeners();
  }

  void switchJobMode(bool switchValue) {
    jobSwitch = switchValue;
    notifyListeners();
  }

  void doneClicked() {
    // Done is clicked
  }
}
