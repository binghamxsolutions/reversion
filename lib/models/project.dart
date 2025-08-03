class Project {
  int? id;
  String displayName;
  String directory;

  Project(this.displayName, this.directory, {this.id});

  Map<String, Object?> toMap() {
    if (id == null) {
      return {"displayName": displayName, "directory": directory};
    } else {
      return {"id": id, "displayName": displayName, "directory": directory};
    }
  }

  @override
  String toString() {
    if (id == null) {
      return "Project{'displayName': $displayName, 'directory': $directory}";
    } else {
      return "Project{'id': $id, 'displayName': $displayName, 'directory': $directory}";
    }
  }
}
