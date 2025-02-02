import 'package:smart_parking_solutions_rest/database.dart';
import 'package:smart_parking_solutions_rest/smart_parking_solutions_rest.dart';

Future main() async {
  final app = Application<SmartParkingSolutionsRestChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  try {
    await DataBase.initDB();
  } on Exception catch (_) {
    print('DB: Failed to initialise database');
  }
  
  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
