import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _onBackgroundHandler(RemoteMessage message) async {
  debugPrint("Notif: ${message.notification?.title}");
  debugPrint("Pesan: ${message.notification?.body}");
}

void _onMessageHandler(RemoteMessage message) {
  debugPrint("Notif: ${message.notification?.title}");
  debugPrint("Pesan: ${message.notification?.body}");
}

Future initializeNotif() async {
  final fcm = FirebaseMessaging.instance;

  FirebaseMessaging.instance
      .getToken()
      .then((value) => {print("Token: $value")});

  // foreground
  FirebaseMessaging.onMessage.listen(_onMessageHandler);
  // background
  FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);

  // onClicked
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('Message: ${message.data} clicked');
  });

  // terminated
  final message = await fcm.getInitialMessage();
  if (message != null) {
    debugPrint("Data Notif: ${message.data}");
  }
}
