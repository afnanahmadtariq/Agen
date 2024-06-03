import 'package:agen/languages.dart';
import 'package:agen/Notfications.dart';
import 'package:agen/Profile.dart';
import 'package:agen/security.dart';
import 'package:agen/TNC.dart';
import 'package:agen/invite_friends.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Setting'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Alex',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'hernandex.redial@gmail.ac.in',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Settings Options
          SettingsOption(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen())); },
          ),
          SettingsOption(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications())); },
          ),
          SettingsOption(
            icon: Icons.security_outlined,
            title: 'Security',
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Security())); },
          ),
          SettingsOption(
            icon: Icons.language,
            title: 'Language',
            trailing: const Text(
              'English (US)',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Languages())); 
              },
          ),
          SettingsOption(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            onTap: () {},
          ),
          SettingsOption(
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAndConditions())); },
          ),
          SettingsOption(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),
          SettingsOption(
            icon: Icons.group_add_outlined,
            title: 'Invite Friends',
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const InviteFriends())); },
          ),
          SettingsOption(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;

  const SettingsOption({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
