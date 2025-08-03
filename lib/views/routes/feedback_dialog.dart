import 'package:flutter/material.dart';
import 'package:reversion/views/widgets/custom_floating_action_button.dart';
import 'package:reversion/views/widgets/heading.dart';

class FeedbackDialog extends StatefulWidget {
  ///Presents a user interface that is based on the user's selection
  const FeedbackDialog(this.type, this.isSuccessful, {super.key});
  final String type;
  final bool isSuccessful;

  @override
  State<StatefulWidget> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  String successMsg = "";
  String errorMsg = "";

  @override
  Widget build(BuildContext context) {
    if (widget.isSuccessful == true && widget.type == "project") {
      successMsg = "The new project directory has been successfully added!";
    } else if (widget.isSuccessful == true && widget.type == "note") {
      successMsg = "The new release notes have been successfully added!";
    } else if (widget.isSuccessful == false && widget.type == "project") {
      errorMsg =
          "There was an issue adding the new project directory to the database. Please review the project details and try again.";
    } else if (widget.isSuccessful == false && widget.type == "note") {
      errorMsg =
          "There was an issue adding the new release notes. Please review the release note details and try again.";
    } //customizes the output message based on the object type and success status

    return AlertDialog(
      title: (widget.isSuccessful == true)
          ? Heading("Success", color: Colors.lightGreen)
          : Heading("Error", color: Colors.red),
      content: (widget.isSuccessful == true)
          ? Text(
              successMsg,
              style: TextStyle(fontSize: 16, fontFamily: 'Gentium Book Plus'),
            )
          : Text(
              errorMsg,
              style: TextStyle(fontSize: 16, fontFamily: 'Gentium Book Plus'),
            ),
      actions: [
        FAB(
          "Close",
          color: Colors.black,
          backgroundColor: Color(0xFF818181),
          actionOnPressed: () {
            (widget.isSuccessful == true)
                ? Navigator.of(context).pushNamed('/')
                : Navigator.of(context).pop();
          },
          // redirects the user to the home screen or previous screen depending on the success status
        ),
      ],
    );
  }
}
