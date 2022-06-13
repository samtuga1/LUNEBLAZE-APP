import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:luneblaze_app/core/view_models/create_community_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreateCommunityView extends StatelessWidget {
  const CreateCommunityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateCommunityViewModel>.reactive(
      viewModelBuilder: () => CreateCommunityViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: GlobalAppBar(
          title: 'CREATE COMMUNITY',
          onTap: model.goBack,
        ),
        body: Form(
          key: model.formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(clipBehavior: Clip.none, children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Color(0xFFEDEDED),
                  child: Center(
                    child: Icon(Icons.photo_camera),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 23,
                  child: PhysicalModel(
                    elevation: 2,
                    color: Colors.grey,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                      ),
                      width: 80,
                      height: 80,
                      child: Center(
                        child: Icon(Icons.photo_camera),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 65,
              ),
              // For community name
              CommunityInfo(
                title: 'Community name',
                trailingWidget: Text(
                  '${model.community_name_length}/40',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xFFEDEDED),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextFormField(
                        // key: model.formKey,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Community name cannot be left empty';
                          }
                          if (value.length > 40) {
                            return 'Community name cannot exceed 40 characters';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          model.toggle_community_name_length(value.length);
                        },
                        decoration: InputDecoration(
                          label: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Community name'),
                          ),
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ----------------------------------------
              const SizedBox(
                height: 25,
              ),
              // For Community Bio
              CommunityInfo(
                title: 'Bio',
                trailingWidget: Text(
                  '${model.bio_length}/200',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xFFEDEDED),
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    //  key: model.formKey,
                    maxLines: 2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Bio cannot be left empty';
                      }
                      if (value.length > 40) {
                        return 'Bio cannot exceed 200 characters';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      model.toggle_bio_length(value.length);
                    },
                    decoration: InputDecoration(
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text('Add a short descripction of your community'),
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              // ---------------------------------------
              const SizedBox(
                height: 25,
              ),
              // For Interests
              CommunityInfo(
                title: 'Interests',
                trailingWidget: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ),
              // ---------------------------------
              const SizedBox(
                height: 25,
              ),
              // For Community Description
              CommunityInfo(
                title: 'Description',
                trailingWidget: Text(
                  '${model.description_length}/4000',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xFFEDEDED),
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    //  key: model.formKey,
                    maxLines: 13,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Description cannot be left empty';
                      }
                      if (value.length > 40) {
                        return 'Description cannot exceed 4000 characters';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      model.toggle_description_length(value.length);
                    },
                    decoration: InputDecoration(
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Detailed description of the community'),
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              // ---------------------------------------
              const SizedBox(
                height: 25,
              ),
              // ADD COMMUNITY BUTTON
              GestureDetector(
                onTap: model.add_community,
                child: Container(
                  color: Color(0xFFC7C7C7).withOpacity(0.15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        'ADD COMMUNITY',
                        style: TextStyle(color: Colors.white, fontSize: 16.5),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CommunityInfo extends StatelessWidget {
  const CommunityInfo({
    Key? key,
    required this.title,
    required this.trailingWidget,
  }) : super(key: key);
  final String title;
  final Widget trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          const Spacer(),
          trailingWidget
        ],
      ),
    );
  }
}
