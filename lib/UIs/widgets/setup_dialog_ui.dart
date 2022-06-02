import 'package:flutter/material.dart';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/view_models/privacy_settings_viewmodel.dart';

/// The type of dialog to show
enum DialogType { basic, form }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
    DialogType.form: (context, sheetRequest, completer) =>
        _FormDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: null,
    );
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
              Text(request.title ?? 'This is title'),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  // This generates the Radio buttons which is selectable
                  PrivacySettingViewModel().privacyType.length,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(children: [
                      Text(PrivacySettingViewModel().privacyType[index][0]),
                      Spacer(),
                      GestureDetector(
                        onTap: () => completer(
                            DialogResponse(confirmed: false, data: index)),
                        child: Column(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              child: PrivacySettingViewModel()
                                      .privacyType[index][1]
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : null,
                              decoration: BoxDecoration(
                                color: PrivacySettingViewModel()
                                        .privacyType[index][1]
                                    ? Colors.green
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
