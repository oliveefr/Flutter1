import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Correct import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // URL media sosial
  final String instagramUrl = 'https://www.instagram.com/oliveefr_';
  final String githubUrl = 'https://github.com/oliveefr';

  const HomePage({super.key});

  // Fungsi untuk membuka URL
  void _launchURL(String url) async {
    final Uri uri =
        Uri.parse(url); // Make sure the URL is parsed into Uri format
    // ignore: deprecated_member_use
    if (await canLaunch(uri.toString())) {
      // ignore: deprecated_member_use
      await launch(uri.toString(),
          forceSafariVC: true, forceWebView: true); // Launch URL
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PORTOFOLIO'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        titleTextStyle:
            const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  'Olive',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text('oliveframitha@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/gwen.jpg'),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.deepPurple),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.link, color: Colors.pink),
                    title: const Text('Instagram'),
                    onTap: () => _launchURL(instagramUrl),
                  ),
                  ListTile(
                    leading: const Icon(Icons.code, color: Colors.black),
                    title: const Text('GitHub'),
                    onTap: () => _launchURL(githubUrl),
                  ),
                  const Divider(),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout successful!')),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/gwen.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Olive',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Flutter Developer | Mobile App Enthusiast',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              'Selamat datang di aplikasi portofolio pribadi saya! '
              'Di sini, Anda dapat melihat hasil portofolio yang saya buat untuk project UTS dengan fitur- fitur menarik didalamnya '
              'Jangan ragu untuk terhubung dengan saya melalui link yang tersedia. ENJOY!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
