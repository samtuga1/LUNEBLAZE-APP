import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/custom_loading_spinner.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:stacked/stacked.dart';
import '../../core/view_models/create_institutions_viewmodel.dart';

class CreateInstitutionsView extends StatelessWidget {
  const CreateInstitutionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateInstitutionsViewModel>.reactive(
      viewModelBuilder: () => CreateInstitutionsViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: GlobalAppBar(
            backgroundColor:
                model.loading ? Colors.grey.withOpacity(0.15) : Colors.white,
            title: 'REGISTER YOUR INSTITUTION',
            onTap: model.goBack),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: model.formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Institution name
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Institution Name',
                                  style: TextStyle(fontSize: 17),
                                ),
                                const Spacer(),
                                Text(
                                  '${model.institutionNameLength}/60',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          // Text Field for institution name
                          ReusableTextField(
                            keyboardType: TextInputType.text,
                            hintText: 'Eg. XYZ Institue',
                            onChanged: (value) {
                              model.institutionName = value;
                              model.toggleInstitutionNameLength(value.length);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter institution name';
                              }
                              if (value.length > 60) {
                                return 'Institution name cannot exceed 60 characters';
                              }
                              return null;
                            },
                          ),
                          // ------------------------------------
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              'Buisness Email',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          ReusableTextField(
                            onChanged: (value) {
                              model.businessEmail = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Eg. John.smith@xyz.com',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter business email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              'Business Phone',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),

                          ReusableTextField(
                            onChanged: (value) {
                              model.businessPhone = value;
                            },
                            keyboardType: TextInputType.numberWithOptions(),
                            hintText: 'Eg. 9876543210',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter business phone';
                              }
                              if (value.length > 10 || value.length < 10) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              'Website',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),

                          ReusableTextField(
                            onChanged: (value) {
                              model.website = value;
                            },
                            keyboardType: TextInputType.url,
                            hintText: 'Eg. www.xyz.com',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter website url';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Is your Institute a college ?',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Switch.adaptive(
                                activeColor: Colors.teal,
                                value: model.switchCollege,
                                onChanged: (value) {
                                  model.switchCollegePressed(value);
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 65,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      model.validateAndRegister();
                    },
                    child: Container(
                      color: Color(0xFFC7C7C7).withOpacity(0.15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 6),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            'REGISTER',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (model.loading)
            Container(
              color: Colors.grey.withOpacity(0.15),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Center(
                child: CustomLoadingSpinner(
                  loadingText: 'Registering institution. Please wait',
                ),
              ),
            )
        ]),
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.onChanged,
    required this.keyboardType,
  }) : super(key: key);
  final String hintText;
  final Function(String value) validator;
  final Function(String value) onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: (value) => onChanged(value),
        validator: (value) => validator(value!),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 19),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
