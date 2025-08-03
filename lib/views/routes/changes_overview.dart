import 'package:flutter/material.dart';
import 'package:reversion/controllers/release_note_controller.dart';
import 'package:reversion/models/release_note.dart';
import 'package:reversion/views/routes/feedback_dialog.dart';
import 'package:reversion/views/widgets/custom_floating_action_button.dart';
import 'package:reversion/views/widgets/heading.dart';
import 'package:reversion/views/widgets/label.dart';

class ChangesOverview extends StatefulWidget {
  ///Presents a user interface that is based on the user's selection
  const ChangesOverview(this.releaseNote, {super.key});
  final ReleaseNote releaseNote;

  @override
  State<StatefulWidget> createState() => _ChangesOverviewState();
}

class _ChangesOverviewState extends State<ChangesOverview> {
  @override
  Widget build(BuildContext context) {
    List changeList = widget.releaseNote.changes!.toList();
    List<Widget> outputChanges = [];

    for (var changes in changeList) {
      var change = changes["change"];
      outputChanges.add(
        Text(
          change,
          style: TextStyle(fontFamily: 'Gentium Book Plus', fontSize: 18),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Heading("Review"),
      ),
      backgroundColor: Color(0xFFF15A24),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 150, right: 150),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 15,
                children: [
                  Label("Version", Colors.white, fontSize: 24),
                  Text(
                    widget.releaseNote.version!,
                    style: TextStyle(
                      fontFamily: 'Gentium Book Plus',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label("Changes", Colors.white, fontSize: 24),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: outputChanges,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FAB(
            "Edit",
            heroTag: null,
            actionOnPressed: () => {Navigator.of(context).pop()},
            color: Colors.black,
            backgroundColor: Colors.white,
            tooltip: 'Go back to editing',
          ),
          FAB(
            "Submit changes",
            heroTag: "Done",
            actionOnPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FeedbackDialog(
                    "note",
                    ReleaseNoteController().create(widget.releaseNote),
                  ),
                ),
              );
            },
            tooltip: 'Add the new release information to the existing document',
          ),
        ],
      ),
    );
  }
}
