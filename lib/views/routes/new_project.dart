import 'package:flutter/material.dart';
import 'package:reversion/controllers/project_controller.dart';
import 'package:reversion/models/project.dart';
import 'package:reversion/views/routes/feedback_dialog.dart';
import 'package:reversion/views/widgets/custom_floating_action_button.dart';
import 'package:reversion/views/widgets/heading.dart';
import 'package:reversion/views/widgets/label.dart';

class NewProject extends StatefulWidget {
  ///Presents a user interface that is based on the user's selection
  const NewProject({super.key});

  @override
  State<StatefulWidget> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController directoryController = TextEditingController();
  late Project newProject;
  bool hasProjectName = false;
  bool hasProjectDirectory = false;
  bool formFilled = false;

  @override
  Widget build(BuildContext context) {
    FAB addProject = FAB(
      'Add project',
      actionOnPressed: () {
        if (_formKey.currentState!.validate()) {
          //TODO add method to review and add the project directory dB table
          String displayName = directoryController.text;
          String directory = nameController.text;
          newProject = Project(displayName, directory);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FeedbackDialog(
                "project",
                ProjectController().create(newProject),
              ),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Heading("Add a project"),
      ),
      backgroundColor: Color(0xFFFBB03B),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 150, right: 150),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Label(
                      "What's the name of the project",
                      Colors.black,
                    ),
                  ),
                  onChanged: (name) {
                    setState(() {
                      if (name.trim().isNotEmpty || name.trim() != "") {
                        hasProjectName = true;
                      } else {
                        hasProjectName = false;
                      }
                    });
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: directoryController,
                      decoration: InputDecoration(
                        label: Label(
                          "Choose the project's release note file",
                          Colors.black,
                        ),
                      ),
                      validator: (directory) {
                        if (directory!.trim().isNotEmpty ||
                            directory.trim() == "") {
                          //TODO verify if the directory exists
                          //IF directory exists
                          //newProject.directory = directoryController.text;
                          return null;
                        } else {
                          return "Please enter a valid project directory";
                        }
                      },
                      onChanged: (directory) {
                        setState(() {
                          if (directory.trim().isNotEmpty ||
                              directory.trim() != "") {
                            hasProjectDirectory = true;
                          } else {
                            hasProjectDirectory = false;
                          }
                        });
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO use file picker to select the directory
                      //optional output to inform user if there is no
                      //release_notes.json file in the directory and
                      //prompt to create one before adding to dB or cancel
                    },
                    child: Text(
                      "Browse",
                      style: TextStyle(color: Color(0xFFF15A24)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          (formFilled =
              ((hasProjectName == true) && (hasProjectDirectory == true)))
          ? addProject
          : null,
    );
  }
}
