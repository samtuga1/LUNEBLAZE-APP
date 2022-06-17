import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:stacked/stacked.dart';
import '../../core/view_models/manage_page_viewmodel.dart';

class ManagePageView extends StatelessWidget {
  const ManagePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManagePageViewModel>.reactive(
      onModelReady: (model) => model.make_all_fetching(),
      viewModelBuilder: () => ManagePageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: GlobalAppBar(
          title: 'MANAGE PAGE',
          onTap: model.goBack,
        ),
        body: Column(
          children: [
            const Divider(
              thickness: 4,
            ),
            // Institution tile
            GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                width: double.infinity,
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: model.navigateToCreateInstitution,
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.home),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Create Institute',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ------End of insttution tile ---------
            const Divider(
              thickness: 4,
            ),
            // Organization tile
            GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Create Organisation',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            // ------- End of organization tile ---------
            // List of institutions and organizations
            model.loading
                ? Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                    child: Column(children: [
                      ListTile(
                        title: Text('Institutes'),
                        trailing: IconButton(
                          icon: Icon(model.viewInstitutes
                              ? Icons.arrow_downward
                              : Icons.arrow_forward_ios),
                          onPressed: model.viewInstitutesPressed,
                        ),
                      ),
                      const Divider(
                        indent: 15,
                      ),
                      if (model.viewInstitutes)
                        // List of institutions
                        ...model.institutions
                            .map((institution) => InstitutesOrganizationTiles(
                                  title: institution.title,
                                  subtitle: institution.subtitle,
                                  logo: institution.logo,
                                ))
                            .toList(),
                      ListTile(
                        title: Text('Organizations'),
                        trailing: IconButton(
                          icon: Icon(model.viewOrganisation
                              ? Icons.arrow_downward
                              : Icons.arrow_forward_ios),
                          onPressed: model.viewOrganisationPressed,
                        ),
                      ),
                      const Divider(
                        indent: 15,
                      ),
                      if (model.viewOrganisation)
                        // List of organizations
                        ...model.organizations
                            .map((organization) => InstitutesOrganizationTiles(
                                  title: organization.title,
                                  subtitle: organization.subtitle,
                                  logo: organization.logo,
                                ))
                            .toList(),
                    ]),
                  ))
          ],
        ),
      ),
    );
  }
}

class InstitutesOrganizationTiles extends StatelessWidget {
  const InstitutesOrganizationTiles({
    Key? key,
    this.title,
    this.subtitle,
    this.logo,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final String? logo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: logo!.isEmpty
                  ? NetworkImage(
                      'https://icon-library.com/images/school-icon/school-icon-19.jpg')
                  : NetworkImage(logo!),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle ?? '',
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ]),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
