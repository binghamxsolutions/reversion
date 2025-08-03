import 'package:reversion/models/project.dart';

class ProjectController {
  ///Creates a new database/table if it does not already exist and creates a new record
  bool create(Project project) {
    //TODO add option that allows the project id to autoincrement
    return false;
  }

  ///Queries and returns a singular record
  Project read() {
    Project project = Project("", "");

    return project;
  }

  ///Queries and returns all records
  List<Project> readAll() {
    List<Project> projects = [];

    return projects;
  }

  ///Sends an update query to the database and returns whether the attempts was successful
  bool update(Project project) {
    return false;
  }

  ///Sends a delete query to the database and returns whether the attempt was successful
  bool delete(Project project) {
    //check if passing only the id is more useful
    return false;
  }
}
