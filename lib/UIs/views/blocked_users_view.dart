import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:stacked/stacked.dart';
import '../../core/view_models/blocked_users_viewmodel.dart';

class BlockedUsersView extends StatelessWidget {
  const BlockedUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BlockedUsersViewModel>.reactive(
      viewModelBuilder: () => BlockedUsersViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: GlobalAppBar(
            backgroundColor: Colors.white,
            title: 'BLOCKED USERS',
            onTap: model.goBack,
          ),
          body: SafeArea(
            child: Column(children: [
              model.blockedUser!.isEmpty
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Text(
                          'There are no blocked users.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  : ListTile()
            ]),
          )),
    );
  }
}
