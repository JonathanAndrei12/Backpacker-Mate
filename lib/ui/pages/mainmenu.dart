part of 'pages.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 3;
  static List<Widget> _widgetOptions = <Widget>[
    BudgetManagementPage(),
    HotelRecommendationPage(),
    HistoryPage(),
    AccountPage()
  ];
  void _onItemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[200],
          selectedItemColor: Colors.blue,
          selectedFontSize: 15,
          unselectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.money_dollar_circle), 
                label: 'Budget'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_city), 
                label: 'Hotel'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dehaze_rounded), 
                label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), 
                label: 'My Account'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemtapped,
        ),
      ),
    );
  }
}
