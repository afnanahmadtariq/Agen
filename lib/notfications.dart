import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // Notification options (replace with actual boolean values based on your app)
  bool _enableAlerts = true;
  bool _enableSounds = true;
  bool _enableVibrate = true;
  bool _enablePreviews = true;
  bool _enableHighPriority = true;
  bool _enableLights = true;
  bool _enableInLockScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        children: [
          // Notification Style
          ListTile(
            title: const Text('Notification Style'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to notification style settings (if applicable)
            },
          ),
          const Divider(),

          // Alerting
          SwitchListTile(
            title: const Text('Alerts'),
            value: _enableAlerts,
            onChanged: (val) => setState(() => _enableAlerts = val),
          ),
          SwitchListTile(
            title: const Text('Sounds'),
            value: _enableSounds,
            onChanged: (val) => setState(() => _enableSounds = val),
          ),
          SwitchListTile(
            title: const Text('Vibrate'),
            value: _enableVibrate,
            onChanged: (val) => setState(() => _enableVibrate = val),
          ),

          // Appearance
          SwitchListTile(
            title: const Text('Show message preview'),
            value: _enablePreviews,
            onChanged: (val) => setState(() => _enablePreviews = val),
          ),

          // Behavior
          SwitchListTile(
            title: const Text('Set as high priority'),
            value: _enableHighPriority,
            onChanged: (val) => setState(() => _enableHighPriority = val),
          ),
          SwitchListTile(
            title: const Text('Show lights'),
            value: _enableLights,
            onChanged: (val) => setState(() => _enableLights = val),
          ),
          SwitchListTile(
            title: const Text('Allow on lock screen'),
            value: _enableInLockScreen,
            onChanged: (val) => setState(() => _enableInLockScreen = val),
          ),
        ],
      ),
    );
  }
}
