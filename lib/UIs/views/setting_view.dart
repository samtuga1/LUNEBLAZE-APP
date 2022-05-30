import 'package:flutter/material.dart';
import 'package:luneblaze_app/core/view_models/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:luneblaze_app/constants/icons.dart';
import '../widgets/header_title.dart';
import '../widgets/list_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
            color: Colors.grey,
          ),
          title: HeaderTitle(title: 'SETTINGS'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTitle(title: 'ACCOUNT'),
                // List tiles of Account settings
                ...ListTile.divideTiles(context: context, tiles: [
                  GetListTile(
                    icon: AppIcons.privacy,
                    title: 'Privacy Settings',
                    subtitle: 'Control who can see your data',
                    onTap: model.navigateToPrivacy,
                  ),
                  GetListTile(
                    icon: AppIcons.community,
                    title: 'Manage Communities',
                    subtitle: 'Create or Manage your communities',
                    onTap: model.navigateToCommunity,
                  ),
                  GetListTile(
                    icon: AppIcons.suitCase,
                    title: 'Manage Page',
                    subtitle:
                        'Create or Manage your Organisation or Institution',
                    onTap: model.navigateToManagePage,
                  ),
                  GetListTile(
                    icon: AppIcons.doc,
                    title: 'Get notified',
                    subtitle: 'Apply for new internship or job',
                    onTap: model.navigateToInternship,
                  ),
                ]).toList(),
                HeaderTitle(title: 'ABOUT'),
                //List tiles of About settings
                ...ListTile.divideTiles(context: context, tiles: [
                  GetListTile(
                    icon: AppIcons.about,
                    title: 'About',
                    subtitle: 'Learn more about Luneblaze',
                    onTap: model.navigateToAbout,
                  ),
                  GetListTile(
                    icon: AppIcons.privacy,
                    title: 'Privacy Policy',
                    subtitle: 'Read Luneblaze Privacy Policy',
                    onTap: model.navigateToPrivacyPolicy,
                  ),
                  GetListTile(
                    icon: AppIcons.session,
                    title: 'Session Policy',
                    subtitle: 'Read Luneblaze Session Policy',
                    onTap: model.navigateToSessionPolicy,
                  ),
                  GetListTile(
                    icon: AppIcons.doc,
                    title: 'Terms Of Use',
                    subtitle: 'View Terms and conditions for usage',
                    onTap: model.navigateToTermsOfUse,
                  ),
                ]).toList(),
                HeaderTitle(title: 'HELP AND SUPPORT'),
                // List tiles of Help and support setting
                ...ListTile.divideTiles(context: context, tiles: [
                  GetListTile(
                    icon: AppIcons.report,
                    title: 'Report',
                    subtitle: 'Report your bug or issue',
                    onTap: model.navigateToReport,
                  ),
                  GetListTile(
                    icon: AppIcons.envelope,
                    title: 'Contact Us',
                    subtitle: 'Need help? Contact us here',
                    onTap: model.contactUs,
                  ),
                  GetListTile(
                    icon: AppIcons.logout,
                    title: 'Logout',
                    subtitle: 'Logout from Luneblaze',
                    onTap: model.logout,
                  ),
                ]).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
