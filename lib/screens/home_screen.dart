import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_app/widgets/destination_carousel.dart';
import 'package:travel_ui_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int currentTab = 0;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: selectedIndex == index
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey[600],
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          icons[index],
          size: 25,
          color: selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey[100],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: icons
                    .asMap()
                    .entries
                    .map((map) => _buildIcon(map.key))
                    .toList()),
            const SizedBox(
              height: 20,
            ),
            const DestinationCarousel(),
            SizedBox(
              height: 20,
            ),
            HotelCarousel()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentTab = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentTab,
          items: [
             BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage:
                    NetworkImage('https://source.unsplash.com/2ArYn5EYYvo'),
              ),
              label: '',
            ),
          ]),
    );
  }
}
