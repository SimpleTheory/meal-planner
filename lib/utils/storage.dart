import 'dart:io';
import 'package:hive/hive.dart';
import 'package:nutrition_app/domain.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';


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

void factoryResetApp() async {
  final box = await Hive.openBox('master');

  // Delete a key-value pair
  box.delete('app');

  // Close the box
  await box.close();
}

Future<void> saveAppBackupMobile({String? fileName, required App app}) async {
  fileName ??= 'nut_app_backup.json';
  // Get the downloads directory
  Directory downloadsDirectory = (await DownloadsPath.downloadsDirectory())!;
  // List<FileSystemEntity> files = downloadsDirectory.listSync();
  //
  // List<String> fileNames = files
  //     .where((entity) => entity is File) // Filter out directories
  //     .map((entity) => entity.path.split('/').last) // Extract file names
  //     .toList();
  // Create a File instance with the desired file name
  File file = File('${downloadsDirectory.path}/${(fileName)}');

  // Write the file
  await file.writeAsString(app.toJson());

  print('File saved to ${file.path}');
}