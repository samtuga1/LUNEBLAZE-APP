import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:stacked/stacked.dart';
import '../../core/view_models/manage_page_viewmodel.dart';

class ManagePageView extends StatelessWidget {
  const ManagePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManagePageViewModel>.reactive(
      onModelReady: (model) => model.fakeDelay(),
      viewModelBuilder: () => ManagePageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: GlobalAppBar(
          title: 'MANAGE PAGE',
          onTap: model.goBack,
        ),
        body: model.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const Divider(
                    thickness: 4,
                  ),
                  // Institution tile
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 14),
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
                  // ------End of insttution tile ---------
                  const Divider(
                    thickness: 4,
                  ),
                  // Organization tile
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 14),
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
                  Expanded(
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
                                ))
                            .toList(),
                      ListTile(
                        title: Text('Organizations'),
                        trailing: IconButton(
                            icon: Icon(model.viewOrganisation
                                ? Icons.arrow_downward
                                : Icons.arrow_forward_ios),
                            onPressed: model.viewviewOrganisationPressed),
                      ),
                      const Divider(
                        indent: 15,
                      ),
                      if (model.viewOrganisation)
                        // List of organizations
                        ...model.organization
                            .map((organization) => InstitutesOrganizationTiles(
                                  title: organization.title,
                                  subtitle: organization.subtitle,
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
  }) : super(key: key);
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            Container(
              margin: const EdgeInsets.only(right: 11),
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                border: Border.all(width: 0.4, color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.school),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  subtitle ?? '',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
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
