import 'package:flutter/material.dart';
import 'package:notifications/local_notifications.dart';
import 'package:notifications/product_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final localNotifications = LocalNotifications();

  void listenToNotifications() {
    LocalNotifications.streamController.stream.listen(
      (event) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetails(notificationResponse: event),
        ));
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenToNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                onTap: () {
                  LocalNotifications.showBasic();
                },
                leading: const Icon(Icons.notification_add),
                title: const Text('Basic Notifications'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                onTap: () {
                  LocalNotifications.showRepeated();
                },
                leading: const Icon(Icons.notification_add),
                title: const Text('Repeated Notifications'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                onTap: () {
                  localNotifications.showSchedulled();
                },
                leading: const Icon(Icons.notification_add),
                title: const Text('schedulled Notifications'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
