import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/services/view_models/privacy_settings_viewmodel.dart';

/// The type of dialog to show
enum DialogType { basic, form, no_yes }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final model = PrivacySettingViewModel;
  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
    DialogType.form: (context, sheetRequest, completer) =>
        _FormDialog(request: sheetRequest, completer: completer),
    DialogType.no_yes: (context, sheetRequest, completer) =>
        _NoyesDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _NoyesDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _NoyesDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(request.data.toString());

    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(request.title ?? 'This is a title')),
              // ...List.generate(
              //     2,
              //     (index) => Container(
              //           margin: const EdgeInsets.only(bottom: 20),
              //           child: Row(children: [
              //             Text(
              //               PrivacySettingViewModel
              //                   .yes_or_no_option_types[index][0],
              //             ),
              //             Spacer(),
              //             GestureDetector(
              //               onTap: () => completer(DialogResponse(data: index)),
              //               child: PrivacyTypeIcon(
              //                 request: request,
              //                 index: index,
              //                 privacyIconChild: PrivacySettingViewModel
              //                             .yes_or_no_option_types[index][0] ==
              //                         request.data
              //                     ? Icon(
              //                         Icons.check,
              //                         color: Colors.white,
              //                       )
              //                     : null,
              //                 privacyIconColorDecoration: BoxDecoration(
              //                   color: PrivacySettingViewModel
              //                               .yes_or_no_option_types[index][0] ==
              //                           request.data
              //                       ? Colors.teal
              //                       : null,
              //                   border:
              //                       Border.all(width: 1, color: Colors.grey),
              //                   borderRadius: BorderRadius.circular(26),
              //                 ),
              //               ),
              //             ),
              //           ]),
              //         )).toList()
              test_class(
                request: request,
                completer: completer,
                type: "Yes",
              ),
              test_class(
                completer: completer,
                request: request,
                type: "No",
              )

              // Row(children: [
              //   Text('NO'),
              //   GestureDetector(
              //     onTap: () => completer(DialogResponse(data: 'NO')),
              //     child: Container(
              //       decoration: BoxDecoration(color: Colors.red),
              //       height: 28,
              //       width: 28,
              //       child: request.data.toString() == "NO"
              //           ? Icon(
              //               Icons.check,
              //               color: Colors.white,
              //             )
              //           : null,
              //       //   decoration:  ,
              //     ),
              //     // PrivacyTypeIcon(
              //     //   request: request,
              //     //   index: index,
              //     //   privacyIconChild: PrivacySettingViewModel
              //     //               .yes_or_no_option_types[index][0] ==
              //     //           request.data
              //     //       ? Icon(
              //     //           Icons.check,
              //     //           color: Colors.white,
              //     //         )
              //     //       : null,
              //     //   privacyIconColorDecoration: BoxDecoration(
              //     //     color: PrivacySettingViewModel
              //     //                 .yes_or_no_option_types[index][0] ==
              //     //             request.data
              //     //         ? Colors.teal
              //     //         : null,
              //     //     border: Border.all(width: 1, color: Colors.grey),
              //     //     borderRadius: BorderRadius.circular(26),
              //     //   ),
              //     // ),
              //   ),
              // ]),
            ],
          ),
        ),
      ),
    );
  }
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog();
  }
}

class _FormDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  _FormDialog({Key? key, required this.request, required this.completer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(request.title ?? 'This is title')),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  // This generates the Radio buttons which is selectable
                  PrivacySettingViewModel.privacyType.length,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(children: [
                      Text(PrivacySettingViewModel.privacyType[index][0]),
                      Spacer(),
                      GestureDetector(
                        onTap: () => completer(DialogResponse(data: index)),
                        child: Column(
                          children: [
                            PrivacyTypeIcon(
                              privacyIconChild: PrivacySettingViewModel
                                          .privacyType[index][0] ==
                                      request.data
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : null,
                              privacyIconColorDecoration: BoxDecoration(
                                color: PrivacySettingViewModel
                                            .privacyType[index][0] ==
                                        request.data
                                    ? Colors.teal
                                    : null,
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyTypeIcon extends StatelessWidget {
  const PrivacyTypeIcon({
    Key? key,
    required this.privacyIconChild,
    required this.privacyIconColorDecoration,
  }) : super(key: key);

  final Decoration privacyIconColorDecoration;
  final Icon? privacyIconChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      child: privacyIconChild,
      decoration: privacyIconColorDecoration,
    );
  }
}

class test_class extends StatelessWidget {
  final Function(DialogResponse) completer;
  final DialogRequest request;
  final String type;

  const test_class(
      {Key? key,
      required this.completer,
      required this.request,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(children: [
        Text(type),
        Spacer(),
        GestureDetector(
          onTap: () => completer(DialogResponse(data: type)),
          child: Column(
            children: [
              PrivacyTypeIcon(
                privacyIconChild: request.data == type
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : null,
                privacyIconColorDecoration: BoxDecoration(
                  color: type == request.data ? Colors.teal : null,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
