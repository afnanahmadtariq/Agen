// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  bool _useRememberMe = true;
  bool _useBiometric = true;
  bool _useFaceId = false; // Assuming Face ID is a type of Biometric

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Remember Me'),
            value: _useRememberMe,
            onChanged: (val) => setState(() => _useRememberMe = val),
          ),
          SwitchListTile(
            title: const Text('Use Biometric ID'),
            value: _useBiometric,
            onChanged: (val) => setState(() => _useBiometric = val),
          ),
          if (_useBiometric) // Conditionally display Face ID option
            SwitchListTile(
              title: const Text('Use Face ID'),
              value: _useFaceId,
              onChanged: (val) => setState(() => _useFaceId = val),
            ),
          ListTile(
            title: const Text('Change Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Change Password screen
            },
          ),
          // Add more security settings here
        ],
      ),
    );
  }
}
