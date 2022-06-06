import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:luneblaze_app/core/services/view_models/get_notified_viewmodel.dart';
import 'package:stacked/stacked.dart';

class GetNotifiedView extends StatelessWidget {
  const GetNotifiedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GetNotifiedViewModel>.reactive(
        viewModelBuilder: () => GetNotifiedViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color(0xFFEDEDED),
              appBar: GlobalAppBar(
                title: 'APPLY FOR JOB/INTERNSHIP',
                onTap: model.goBack,
              ),
              body: SafeArea(
                child: Stack(children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6.5),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Course'),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  DetailSelector(
                                    popUpButton: PopupMenuButton(
                                      icon: Icon(Icons.arrow_downward),
                                      onSelected: (dynamic value) {
                                        model.selectCourseOption(value);
                                      },
                                      itemBuilder: (_) => [
                                        PopupMenuItem(
                                          child: Text(
                                            model.course_choice_options[0],
                                          ),
                                          value: model.course_choice_options[0],
                                        ),
                                        PopupMenuItem(
                                          child: Text(
                                            model.course_choice_options[1],
                                          ),
                                          value: model.course_choice_options[1],
                                        ),
                                        PopupMenuItem(
                                          child: Text(
                                            model.course_choice_options[2],
                                          ),
                                          value: model.course_choice_options[2],
                                        ),
                                        PopupMenuItem(
                                          child: Text(
                                            model.course_choice_options[3],
                                          ),
                                          value: model.course_choice_options[3],
                                        )
                                      ],
                                    ),
                                    currentValue:
                                        model.course_choice_options[0],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Field Of Study'),
                                            DetailSelector(
                                              popUpButton: PopupMenuButton(
                                                icon:
                                                    Icon(Icons.arrow_downward),
                                                onSelected: (dynamic value) {
                                                  model
                                                      .selectStudyOption(value);
                                                },
                                                itemBuilder: (_) => [
                                                  PopupMenuItem(
                                                    child: SizedBox(
                                                      child: Text(
                                                        model.study_choice_options[
                                                            0],
                                                      ),
                                                    ),
                                                    value: model
                                                        .study_choice_options[0],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.study_choice_options[
                                                          1],
                                                    ),
                                                    value: model
                                                        .study_choice_options[1],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.study_choice_options[
                                                          2],
                                                    ),
                                                    value: model
                                                        .study_choice_options[2],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.study_choice_options[
                                                          3],
                                                    ),
                                                    value: model
                                                        .study_choice_options[3],
                                                  )
                                                ],
                                              ),
                                              currentValue:
                                                  model.study_choice_options[0],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 35,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Year of passing'),
                                            DetailSelector(
                                              popUpButton: PopupMenuButton(
                                                icon:
                                                    Icon(Icons.arrow_downward),
                                                onSelected: (dynamic value) {
                                                  model.selectYearOfPass(value);
                                                },
                                                itemBuilder: (_) => [
                                                  PopupMenuItem(
                                                    child: SizedBox(
                                                      child: Text(
                                                        model.year_passing_options[
                                                            0],
                                                      ),
                                                    ),
                                                    value: model
                                                        .year_passing_options[0],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.year_passing_options[
                                                          1],
                                                    ),
                                                    value: model
                                                        .year_passing_options[1],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.year_passing_options[
                                                          2],
                                                    ),
                                                    value: model
                                                        .year_passing_options[2],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.year_passing_options[
                                                          3],
                                                    ),
                                                    value: model
                                                        .year_passing_options[3],
                                                  )
                                                ],
                                              ),
                                              currentValue:
                                                  model.year_passing_options[0],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Percentage'),
                                            DetailSelector(
                                              popUpButton: PopupMenuButton(
                                                icon:
                                                    Icon(Icons.arrow_downward),
                                                onSelected: (dynamic value) {
                                                  model.selectpercentageOption(
                                                      value);
                                                },
                                                itemBuilder: (_) => [
                                                  PopupMenuItem(
                                                    child: SizedBox(
                                                      child: Text(
                                                        model.percentage_choice_options[
                                                            0],
                                                      ),
                                                    ),
                                                    value: model
                                                        .percentage_choice_options[0],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.percentage_choice_options[
                                                          1],
                                                    ),
                                                    value: model
                                                        .percentage_choice_options[1],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.percentage_choice_options[
                                                          2],
                                                    ),
                                                    value: model
                                                        .percentage_choice_options[2],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.percentage_choice_options[
                                                          3],
                                                    ),
                                                    value: model
                                                        .percentage_choice_options[3],
                                                  )
                                                ],
                                              ),
                                              currentValue: model
                                                  .percentage_choice_options[0],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 35,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Year of start'),
                                            DetailSelector(
                                              popUpButton: PopupMenuButton(
                                                icon:
                                                    Icon(Icons.arrow_downward),
                                                onSelected: (dynamic value) {
                                                  model
                                                      .selectStartingYearOption(
                                                          value);
                                                },
                                                itemBuilder: (_) => [
                                                  PopupMenuItem(
                                                    child: SizedBox(
                                                      child: Text(
                                                        model.starting_year_options[
                                                            0],
                                                      ),
                                                    ),
                                                    value: model
                                                        .starting_year_options[0],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.starting_year_options[
                                                          1],
                                                    ),
                                                    value: model
                                                        .starting_year_options[1],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.starting_year_options[
                                                          2],
                                                    ),
                                                    value: model
                                                        .starting_year_options[2],
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      model.starting_year_options[
                                                          3],
                                                    ),
                                                    value: model
                                                        .starting_year_options[3],
                                                  )
                                                ],
                                              ),
                                              currentValue: model
                                                  .starting_year_options[0],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 9),
                          child: Row(
                            children: [
                              Text('Apply for Internship'),
                              const Spacer(),
                              Switch.adaptive(
                                activeColor: Colors.teal,
                                value: model.internshipSwitch,
                                onChanged: (value) =>
                                    model.switchInternshipMode(value),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 9),
                          child: Row(
                            children: [
                              Text('Apply for job'),
                              const Spacer(),
                              Switch.adaptive(
                                activeColor: Colors.teal,
                                value: model.jobSwitch,
                                onChanged: (value) =>
                                    model.switchJobMode(value),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Color(0xFFC7C7C7),
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
                            'Done',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ));
  }
}

class DetailSelector extends StatelessWidget {
  const DetailSelector({
    Key? key,
    required this.currentValue,
    required this.popUpButton,
  }) : super(key: key);
  final String currentValue;
  final Widget popUpButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 7,
          ),
          Text(currentValue),
          const Spacer(),
          popUpButton,
          const SizedBox(
            width: 7,
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xFFEDEDED),
          border: Border.all(color: Colors.grey, width: 0.4),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
