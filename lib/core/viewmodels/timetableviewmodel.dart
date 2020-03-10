
import 'package:classapp/core/services/firestore_service.dart';

import 'package:classapp/core/viewmodels/baseviewmodel.dart';
import 'package:classapp/ui/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimeTableViewmodel extends BaseViewmodel {
  final FirestoreServcie _firestoreServcie = locator<FirestoreServcie>();
  // final NavigationService _navigationService = locator<NavigationService>();
  
  Stream<QuerySnapshot> getMondays(){
    return _firestoreServcie.getMondayAsStream();
  }

  Stream<QuerySnapshot> getTuesdays(){
    return _firestoreServcie.getTuesdayAsStream();
  }

  Stream<QuerySnapshot> getWednesdays(){
    return _firestoreServcie.getWednesdayAsStream();
  }

  Stream<QuerySnapshot> getThursdays(){
    return _firestoreServcie.getThursdayAsStream();
  }

  Stream<QuerySnapshot> getFridays(){
    return _firestoreServcie.getFridayAsStream();
  }

  // @override
  // void dispose() {
  
  //   super.dispose();

  // }
}
