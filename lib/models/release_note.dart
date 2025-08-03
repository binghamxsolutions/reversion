///A PODO for release notes
class ReleaseNote {
  String? version;
  List<Map<String, String>>? changes;

  ReleaseNote({this.version, this.changes});

  Map<String, Object?> toMap() {
    return {"version": version, "changes": changes};
  }

  //Presents a JSON
  ReleaseNote.fromJson(Map<String, dynamic> json)
    : version = json['version'],
      changes = json['changes'];

  Map<String, dynamic> toJson() => {"version": version, "changes": changes};

  @override
  String toString() {
    return "ReleaseNote{'version': $version, 'changes': $changes}";
  }
}
