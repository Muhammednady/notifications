import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ProductDetails extends StatelessWidget {
  final NotificationResponse notificationResponse;
  const ProductDetails({super.key, required this.notificationResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),

      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(notificationResponse.id.toString() ,) , 
          const SizedBox(height: 10.0,),
          Text(notificationResponse.payload.toString())

      ],),),
    );
  }
}
