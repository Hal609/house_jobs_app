import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:house_jobs/screens/homescreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../reusable_widgets/reusable_widgets.dart';
import 'menu_pages/home_page.dart';
import 'menu_pages/favorites_page.dart';
import 'menu_pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class _MainScreenState extends State<MainScreen> {
  String userName = '';
  String userImage = '';
  GoogleSignInAccount? _currentUser;
  // bool _isAuthorized = false; // has granted permissions?
  // String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      // bool isAuthorized = account != null;

      setState(() {
        _currentUser = account;
        // _isAuthorized = isAuthorized;
      });
    });
    _googleSignIn.signInSilently();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    // if (isLoggedIn) {
    //   setState(() {
    //     userName = prefs.getString('userName') ?? '';
    //     userImage = prefs.getString('userImage') ?? '';
    //   });
    // }
  }

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              onPressed: _handleSignOut,
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isLoggedIn', false);
      // prefs.remove('userName');
      // prefs.remove('userImage');
      // Navigate back to the sign-in screen or any other desired screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Homescreen()),
        (route) => false,
      );
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text("Hello"),
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: <Widget>[
                accountLogo(_currentUser),
                _widgetOptions[_selectedIndex], // Display selected page
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
    );
  }
}
