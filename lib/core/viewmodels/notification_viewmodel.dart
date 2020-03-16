import 'package:classapp/core/services/firestore_service.dart';
import 'package:classapp/core/viewmodels/baseviewmodel.dart';
import 'package:classapp/ui/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationViewmodel extends BaseViewmodel {
  final FirestoreServcie _servcie = locator<FirestoreServcie>();

  Stream<QuerySnapshot> getNotifications() {


    // setBusy(true);
    var notificatons = _servcie.getNotificationsAsStream();
    // setBusy(false);R

    return notificatons;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
