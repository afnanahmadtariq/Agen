import 'package:flutter/material.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  // Sample data (replace with actual contacts)
  final List<Contact> _contacts = [
    Contact(name: 'Rani Thomas', phone: '+91 702-897-7965'),
    Contact(name: 'Anastasia', phone: '+91 702-897-7965'),
    Contact(name: 'Vaibhav', phone: '+91 b727-688-4052'),
    Contact(name: 'Rahul Juman', phone: '+91 601-897-1714'),
    Contact(name: 'Abby', phone: '+91 802-312-320'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Friends'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding
        separatorBuilder: (context, index) => const Divider(thickness: 1.0), // Add divider
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // Shrink trailing content
              children: [
                TextButton.icon(
                  onPressed: () => print('Invite ${contact.name}'), // Handle invite button press
                  icon: const Icon(Icons.person_add, size: 18.0),
                  label: const Text('Invite'),
                  style: TextButton.styleFrom(
                    // primary: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // Add button for Share Invite Via (if applicable based on your image)
      bottomNavigationBar: _buildShareInviteButton(), // Add optional Share Invite Via button
    );
  }

  Widget _buildShareInviteButton() {
    // Replace with your implementation based on the layout in your image
    if (/* condition to show button based on image */true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the button
        children: [
          const Text('Share Invite Via:'),
          const SizedBox(width: 8.0), // Add spacing
          IconButton(
            icon: const Icon(Icons.facebook),
            onPressed: () => print('Share via Facebook'),
          ),
          IconButton(
            icon: const Icon(Icons.add), // Replace with Google+ icon if applicable
            onPressed: () => print('Share via Google+'),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink(); // Hide the button if not applicable
    }
  }
}

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}
