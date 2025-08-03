import 'package:flutter/material.dart';
import 'package:reversion/views/widgets/custom_floating_action_button.dart';
import 'package:reversion/views/widgets/heading.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentOption = "No selection";
  bool projectSelected = false;
  @override
  Widget build(BuildContext context) {
    List<String> menuOptions = [
      "No selection",
      "Project 1",
      "Project 2",
      "Project 3",
    ]; //TODO add a method to call the projects and format as List

    Widget nextButton = FAB(
      "Next",
      actionOnPressed: () => {Navigator.of(context).pushNamed('note')},
      tooltip: 'Start adding new version information',
    );
    UniqueKey dropDownKey = UniqueKey();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xFFFBB03B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: <Widget>[
            Heading('Choose a project:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    key: dropDownKey,
                    value: currentOption,
                    items: menuOptions.map<DropdownMenuItem<String>>((
                      String value,
                    ) {
                      return DropdownMenuItem(
                        value: value,
                        enabled: (value == "No selection") ? false : true,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: (value == "No selection")
                                ? Color(0xFF818181)
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? menuItem) => {
                      setState(() {
                        currentOption = menuItem!;

                        (currentOption == "No selection")
                            ? projectSelected = false
                            : projectSelected = true;
                      }), // show FAB if default not selected
                    },
                    underline: SizedBox(),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Browse",
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                ),
              ],
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed('add');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xffED2028)),
              ),
              child: Text(
                "Add a project",
                style: TextStyle(fontFamily: 'Gentium Book Plus', fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: projectSelected,
        child: nextButton,
      ),
    );
  }
}
