import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();

  // LocalNotifications() {
  //   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //    initialize();
  // }

  static Future<void> initialize() async{
    _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestSoundPermission: true,
        ),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        print('Receive Notifications ');
        print(details.actionId);
      },
      onDidReceiveBackgroundNotificationResponse: (details) {
        print('Receive background notifications');
      },
    );
  }

 static void showBasic() async{
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.high,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound('')),
        iOS: DarwinNotificationDetails(sound: 'ghghghg'));

   await  _flutterLocalNotificationsPlugin.show(1, 'Basic Notifications',
        'Notifications from Muhammed Nady', notificationDetails);
  }

 static void showRepeated() async{
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.high,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound('')),
        iOS: DarwinNotificationDetails(sound: 'ghghghg'));

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        1,
        'Basic Notifications',
        'Notifications from Muhammed Nady',
        RepeatInterval.everyMinute,
        notificationDetails);
  }

  void showSchedulled() {
    // _flutterLocalNotificationsPlugin.zonedSchedule(
    //     id, title, body, scheduledDate, notificationDetails,
    //     uiLocalNotificationDateInterpretation:
    //         uiLocalNotificationDateInterpretation);
  }
}
