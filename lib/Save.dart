import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  final status = await Permission.storage.request();
  if (status.isGranted) {
    // Write to the file here
  } else if (status.isPermanentlyDenied) {
    print('Storage permission permanently denied');
    await openAppSettings();
  } else {
    print('Storage permission denied');
  }
}
