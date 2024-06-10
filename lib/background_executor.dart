import 'package:notifications/local_notifications.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundExecutor {


  Future<void> init() async {

    await Workmanager().initialize(() {
      Workmanager().executeTask(
        (String taskName, Map<String, dynamic>? inputData) async {
          LocalNotifications.showBasic();

          return true;
        },
      );
      
      // Workmanager().registerOneOffTask('uniqueName', 'taskName');
    }, isInDebugMode: true);

     Workmanager().registerPeriodicTask(
        'task unique',
        'Gtaskname',
        frequency: const Duration(seconds: 15),
        backoffPolicy: BackoffPolicy.exponential,
        backoffPolicyDelay:Duration.zero,
        constraints: Constraints(networkType: NetworkType.connected),
        existingWorkPolicy: ExistingWorkPolicy.keep,
        initialDelay: Duration.zero ,
        inputData: {},
        outOfQuotaPolicy: OutOfQuotaPolicy.drop_work_request,
        tag: String.fromCharCode(999999999999999)
      ) ;
      Workmanager().registerOneOffTask('uniqueName', 'taskName' , );

  }

 

}
