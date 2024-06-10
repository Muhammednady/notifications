import 'package:flutter/material.dart';
import 'package:notifications/background_executor.dart';
import 'package:notifications/home_page.dart';
import 'package:notifications/local_notifications.dart';

void main() async{
  String Gtaskname = 'task name';
  
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
        await BackgroundExecutor().init(),  
        await LocalNotifications.initialize(), 
  ] as Iterable<Future>);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MyHomePage(title: 'Flutter Local Notifications'),
    );
  }
}
