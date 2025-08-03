// import 'dart:convert';
import 'package:reversion/models/release_note.dart';

class ReleaseNoteController {
  late ReleaseNote releaseNotes;

  ///Attempts to create a new release note and verifies if the creation was successful
  bool create(ReleaseNote releaseNote) {
    //TODO add the new release note as an object to the `versions` object array value
    /**
     * retrieve the versions kvp
     * capture the value as a of List<Map<String, String>>
     * put new release note in position 0 of that list
     * NOTE: use List.insert(0, releaseNote)
     */
    return false;
  }

  ///Reads all release notes
  List<ReleaseNote>? readAll() {
    return null;
  }

  ///Reads a singular release note and returns it to the call function
  ReleaseNote? read() {
    return null;
  }

  ///Attempts to update a release note and verifies if the update was successful
  bool update() {
    return false;
  }

  ///Attempts to delete a release note and verifies if the deletion was successful
  bool delete() {
    return false;
  }
}
