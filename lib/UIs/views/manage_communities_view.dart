import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:luneblaze_app/UIs/widgets/list_tile.dart';
import 'package:stacked/stacked.dart';

import '../../core/view_models/manage_comunities_viewmodel.dart';

class ManageCommunitiesView extends StatelessWidget {
  const ManageCommunitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageCommunitiesViewModel>.reactive(
      onModelReady: (model) => model.fakeDelay(),
      viewModelBuilder: () => ManageCommunitiesViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0xFFEDEDED),
        appBar: GlobalAppBar(
          backgroundColor: Colors.white,
          title: 'MANAGE COMMUNITIES',
          onTap: model.goBack,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 6),
              child: GetListTile(
                icon: Icons.computer,
                title: 'Create Community',
                onTap: model.createCommunity,
              ),
            ),
            model.loading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
