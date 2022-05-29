import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/views/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:luneblaze_app/constants/icons.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //I used nonReactive because this class does not change state, it will just be used to navigate to other views
    return ViewModelBuilder<SettingsViewModel>.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        // App bar for the settings view
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
            color: Colors.grey,
          ),
          title: Text(
            model.header(
                'SETTINGS'), //Calls the header method inside the settings_view.dart
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerTitle(model,
                    'ACCOUNT'), //Calls the header method inside the settings_view.dart
                // This returns a divided listTiles where the getListTile
                // method is being called from the setting_viewmodel.dart file
                ...ListTile.divideTiles(context: context, tiles: [
                  model.getListTile(AppIcons.privacy, 'Privacy Settings',
                      'Control who can see your data', () {}),
                  model.getListTile(AppIcons.community, 'Manage Communities',
                      'Create or Manage your communities', () {}),
                  model.getListTile(
                      AppIcons.suitCase,
                      'Manage Page',
                      'Create or Manage your Organisation or Institution',
                      () {}),
                  model.getListTile(AppIcons.doc, 'Get notified',
                      'Apply for new internship or job', () {}),
                ]).toList(),
                headerTitle(model,
                    'ABOUT'), //Calls the header method inside the settings_view.dart
                // This returns a divided listTiles where the getListTile
                // method is being called from the setting_viewmodel.dart file
                ...ListTile.divideTiles(context: context, tiles: [
                  model.getListTile(AppIcons.about, 'About',
                      'Learn more about Luneblaze', () {}),
                  model.getListTile(AppIcons.privacy, 'Privacy Policy',
                      'Read Luneblaze Privacy Policy', () {}),
                  model.getListTile(AppIcons.session, 'Session Policy',
                      'Read Luneblaze Session Policy', () {}),
                  model.getListTile(AppIcons.doc, 'Terms Of Use',
                      'View Terms and conditions for usage', () {}),
                ]).toList(),
                headerTitle(model,
                    'HELP AND SUPPORT'), //Calls the header method inside the settings_view.dart
                // This returns a divided listTiles where the getListTile
                // method is being called from the setting_viewmodel.dart file
                ...ListTile.divideTiles(context: context, tiles: [
                  model.getListTile(AppIcons.report, 'Report',
                      'Report your bug or issue', () {}),
                  model.getListTile(AppIcons.envelope, 'Contact Us',
                      'Need help? Contact us here', () {}),
                  model.getListTile(AppIcons.logout, 'Logout',
                      'Logout from Luneblaze', () {}),
                ]).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

// This is a refactoring of the headerTitle because it was being used many times...SO i had to refactor it
  Container headerTitle(SettingsViewModel model, String title) {
    return Container(
      margin: EdgeInsets.only(left: 17),
      child: Text(
        model.header(title),
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
