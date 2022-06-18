import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:luneblaze_app/core/view_models/contact_us_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
      viewModelBuilder: () => ContactUsViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: GlobalAppBar(title: 'CONTACT US', onTap: model.goBack),
        body: model.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: model.formKey,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.black26,
                            thickness: 6.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Select Issue Text
                                Text(
                                  'Select user type',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Issue type container
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(children: [
                                    Text(
                                      model.currentIssue,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    const Spacer(),
                                    // Popup menu here
                                    PopupMenuButton(
                                      icon:
                                          Icon(Icons.arrow_drop_down_outlined),
                                      onSelected: (dynamic value) {
                                        model.selectIssueType(value);
                                      },
                                      itemBuilder: (_) => List.generate(
                                        model.issueType.length,
                                        (index) => PopupMenuItem(
                                          child: Text(
                                            model.issueType[index],
                                          ),
                                          value: model.issueType[index],
                                        ),
                                      ).toList(),
                                    ),
                                  ]),
                                  height: 43,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                // Describe your description
                                Row(
                                  children: [
                                    Text(
                                      'Message Body',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const Spacer(),
                                    Text('${model.descriptionLength}/200'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Description container
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                  ),
                                  width: double.infinity,
                                  child: TextFormField(
                                    maxLines: 8,
                                    validator: (value) {
                                      if (value!.length > 200) {
                                        return 'Description cannot exceed 200 characters';
                                      }
                                      if (value.isEmpty) {
                                        return 'Message body cannot be empty';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      model.increase_description_length(
                                        value.trim().length,
                                      );
                                      model.description = value;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                    // Report Button here
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          model.validateAndReport();
                        },
                        child: Container(
                          color: Color(0xFFC7C7C7).withOpacity(0.15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 6),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                'Send Mail',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
