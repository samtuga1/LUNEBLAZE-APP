import 'package:flutter/material.dart';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

/// The type of dialog to show
enum DialogType { basic, form, no_yes }

void setupDialogUi() {
  final dialogService = locator<DialogService>();
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
              OptionTypeSelector(
                request: request,
                completer: completer,
                type: "Yes",
              ),
              OptionTypeSelector(
                completer: completer,
                request: request,
                type: "No",
              ),
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
              OptionTypeSelector(
                request: request,
                completer: completer,
                type: "Friends",
              ),
              OptionTypeSelector(
                completer: completer,
                request: request,
                type: "Public",
              ),
              OptionTypeSelector(
                completer: completer,
                request: request,
                type: "Me",
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

class OptionTypeSelector extends StatelessWidget {
  final Function(DialogResponse) completer;
  final DialogRequest request;
  final String type;

  const OptionTypeSelector(
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
