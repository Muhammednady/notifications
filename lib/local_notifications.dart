import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // LocalNotifications() {
  //   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //    initialize();
  // }
  static final StreamController<NotificationResponse> streamController = StreamController<NotificationResponse>();
  static Future<void> initialize() async {
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
        streamController.add(details);
        
      },
      onDidReceiveBackgroundNotificationResponse: (details) {
        print('Receive background notifications');
      },
    );
  }

  static Future<void> showBasic() async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.high,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound('') , 
            
            ),
        iOS: DarwinNotificationDetails(sound: 'ghghghg') , 
        
        );

    await _flutterLocalNotificationsPlugin.show(1, 'Basic Notifications',
        'Notifications from Muhammed Nady', notificationDetails , 
        
        );
  }

  static void showRepeated() async {
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

  void showSchedulled() async {
    print(tz.local);   //UTC
    print(tz.TZDateTime.now(tz.local).hour);     //< your current time by 2 hours
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.high,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound('')),
        iOS: DarwinNotificationDetails(sound: 'ghghghg'));
        final localTimeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(localTimeZone));
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'schedulled Notifications',
        'Notifications from Muhammed Nady',
        tz.TZDateTime(
          tz.local,
          2024,
          6,
          9,
          4

        ),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void cancel(){
    
  }
}
