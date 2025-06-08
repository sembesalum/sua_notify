import 'package:flutter/material.dart';
import 'package:sua_notify/screens/cr/profile/profile_edit.dart';

class LectureProfilePage extends StatelessWidget {
  const LectureProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 41, 97, 18),
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ProfileCard with sample data
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ProfileCard(
                name: "Dr Mussa Mussa",
                 regno: "mussamussa@gmail.com",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // General Section
                  Text(
                    "General",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB3B3B3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ProfileOption(
                    leadingIcon: Icons.edit,
                    title: "Edit Profile",
                    subtitle: "Edit Profile Name",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                    },
                  ),
                  ProfileOption(
                    leadingIcon: Icons.lock_outline,
                    title: "Change Password",
                    subtitle: "Update and Strengthen account security",
                    onTap: () {},
                  ),
                  ProfileOption(
                    leadingIcon: Icons.shield_outlined,
                    title: "Terms of Use",
                    subtitle: "Protect your account now",
                    onTap: () {},
                  ),
                  
                  SizedBox(height: 15),
                  // Preferences Section
                  Text(
                    "Preferences",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB3B3B3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  ProfileOption(
                    leadingIcon: Icons.wechat_sharp,
                    title: "Contact Us",
                    subtitle: "Reach to us at any time",
                    onTap: () {},
                  ),
                  ProfileOption(
                    leadingIcon: Icons.info,
                    title: "FAQ",
                    subtitle: "Frequently Asked Question",
                    onTap: () {},
                  ),
                  
                  ProfileOption(
                    leadingIcon: Icons.logout,
                    title: "Logout",
                    subtitle: "Securely logout of account",
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String  regno;

  const ProfileCard({required this.name, required this. regno, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 30, color: Colors.grey[600]),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                   regno,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileOption({
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
