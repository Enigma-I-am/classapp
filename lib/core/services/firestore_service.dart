import 'package:classapp/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServcie {
  final Firestore _db = Firestore.instance;
  CollectionReference _ref;

  Future addUserToUserCollection(String path, UserModel userModel) async {
    try {
      _ref = _db.collection(path);
      _ref.document(userModel.id).setData(userModel.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  void addToCalendar() {
    print("add an event to your calendar");
  }

  void getTimetable() {
    print("get class time table");
  }

  void getEvents4infobox() {
    print("get latest class event");
  }

  void getCourseMaterials() {
    print("Get PDFs and notes for courses");
  }
}
