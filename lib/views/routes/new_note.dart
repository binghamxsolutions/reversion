import 'package:flutter/material.dart';
import 'package:reversion/models/release_note.dart';
import 'package:reversion/views/routes/changes_overview.dart';
import 'package:reversion/views/widgets/custom_floating_action_button.dart';
import 'package:reversion/views/widgets/heading.dart';
import 'package:reversion/views/widgets/label.dart';

class NewNote extends StatefulWidget {
  ///Presents a user interface that is based on the user's selection
  const NewNote({super.key});

  @override
  State<StatefulWidget> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final _formKey = GlobalKey<FormState>();
  ReleaseNote releaseNote = ReleaseNote();
  TextEditingController versionController = TextEditingController(),
      changesController = TextEditingController();
  int counter = 0;
  List<Map<String, String>> changeList = [
    {"change": ""},
  ];
  bool hasVersion = false, hasChange = false, requirementMet = false;
  ValueKey changeKey = ValueKey(0);
  late List<Widget> widgetList = [
    Row(
      spacing: 15,
      children: [
        Label("Version", Colors.black),
        SizedBox(
          width: 300,
          child: TextFormField(
            autofocus: true,
            controller: versionController,
            decoration: InputDecoration(
              helperText: "The new version number",
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (version) {
              setState(() {
                if (version.trim().isNotEmpty || version.trim() != "") {
                  hasVersion = true;
                } else {
                  hasVersion = false;
                }
              });
            },
          ),
        ),
      ],
    ),
    Row(
      key: changeKey,
      spacing: 15,
      children: [
        Label("Changes", Colors.black),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: changesController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              helperText: "A change made to the project",
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (change) {
              changeList[0]["change"] = changesController.text;
              bool isDuplicate = checkDuplicate(change!, changeKey);
              bool isNoteEmpty =
                  change.trim().isNotEmpty || change.trim() != "";

              if (isNoteEmpty == true && isDuplicate == false) {
                hasChange = true;
                return null;
              } else if (isNoteEmpty == true && isDuplicate == true) {
                hasChange = false;
                return "You have already entered that information.";
              } else {
                hasChange = false;
                return "Please enter a change";
              }
            }, //checks for duplicate and empty values
            onChanged: (change) {
              setState(() {
                bool isDuplicate = checkDuplicate(change, changeKey);
                bool isNoteEmpty =
                    change.trim().isNotEmpty || change.trim() != "";

                if (isDuplicate == true || isNoteEmpty == false) {
                  hasChange = false;
                } else {
                  hasChange = true;
                }
              });
            },
          ),
        ),
      ],
    ),
    FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xffF15A24)),
      ),
      onPressed: () {
        setState(() {
          addChange(widgetList.length);
        });
      },
      child: Text(
        "Add another change",
        style: TextStyle(fontFamily: 'Gentium Book Plus', fontSize: 18),
      ),
    ),
  ];

  ///Checks for duplicate change entries and returns a [bool]
  bool checkDuplicate(String change, ValueKey key) {
    int changePosition =
        widgetList.indexWhere((widget) => widget.key == key) - 1;
    changeList[changePosition]["change"] = change;
    int dupeCount = 0;

    for (var i = 0; i < changeList.length; i++) {
      var note = changeList[i]["change"];
      if (i != changePosition && note == change) {
        dupeCount++;
      }
    }
    return dupeCount > 0;
  }

  ///Increments the counter used to generate [ValueKey]s
  int incrementCounter() {
    counter++;
    return counter;
  }

  ///Dynamically adds a row widget for entering new change data
  void addChange(int listCount) {
    bool isDuplicate = false;
    TextEditingController tec = TextEditingController();
    ValueKey key = ValueKey(incrementCounter());

    changeList.add({"change": ""});
    hasChange = false;
    // ensure new fields have a corresponsing `changeList` entry and are filled before proceeding

    Row newChange = Row(
      key: key,
      spacing: 15,
      children: [
        Label("Changes", Colors.black),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: tec,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              helperText: "A change made to the project",
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (change) {
              bool isNotEmpty =
                  change!.trim().isNotEmpty || change.trim() != "";

              if (isNotEmpty == true && isDuplicate == false) {
                return null;
              } else if (isNotEmpty == true && isDuplicate == true) {
                return "You have already entered that information.";
              } else {
                return "Please enter a change or remove this field";
              }
            }, //checks for duplicate and empty values
            onChanged: (change) {
              setState(() {
                isDuplicate = checkDuplicate(change, key);
                bool isNotEmpty =
                    change.trim().isNotEmpty || change.trim() != "";
                if (isDuplicate == true || isNotEmpty == false) {
                  hasChange = false;
                } else {
                  hasChange = true;
                }
              });
            },
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              int widgetPosition = widgetList.indexWhere(
                (widget) => widget.key == key,
              );
              int changePosition = widgetPosition - 1;
              changeList.removeAt(changePosition);
              //removes the current entry from the change list

              tec.dispose();
              widgetList.removeAt(widgetPosition);
              //removes the current widget from the scaffold
            });
          },
          icon: Icon(Icons.remove),
        ),
      ],
    );
    int listPosition = listCount - 1;

    return widgetList.insert(listPosition, newChange);
  }

  @override
  Widget build(BuildContext context) {
    FAB reviewButton = FAB(
      "Review",
      actionOnPressed: () {
        if (_formKey.currentState!.validate()) {
          //TODO add method to review and add the project directory dB table
          String version = versionController.text;
          releaseNote = ReleaseNote(version: version, changes: changeList);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangesOverview(releaseNote),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Heading("Add new release notes"),
      ),
      backgroundColor: Color(0xFFFBB03B),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(150),
              itemCount: widgetList.length,
              itemBuilder: (BuildContext bc, index) => widgetList[index],
            ),
          ),
        ),
      ),
      floatingActionButton:
          (requirementMet = (hasVersion == true) && (hasChange == true))
          ? reviewButton
          : null,
    );
  }
}
