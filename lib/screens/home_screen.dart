import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 120.0, left: 20.0),
              child: Text(
                'What you would like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList(),
            ),
            const SizedBox(height: 20.0),
            DestinationCarousel(),
            const SizedBox(height: 20.0),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => setState(() => _currentTab = index),
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http:/i.imgur.com/zL4Krbz.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
