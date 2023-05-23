import 'package:hive/hive.dart';
import 'package:nutrition_app/domain.dart';

void saveApp(App app) async {
  final box = await Hive.openBox('master');
  // Perform read/write operations on the box
  box.put('app', app.toJson());
  await box.close();
}

Future<App?> loadApp() async {
  final boxExists = await Hive.boxExists('master');
  if (boxExists) {
    try {
      final box = await Hive.openBox('master');
      final json = box.get('app');
      await box.close();
      return App.fromJson(json);
    } catch (e) {
      return null;
    }
  } else {
    return null;
  }
}