import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/hotels_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //variables
  int selected = 0;
  int _currentTab = 0;

  // List of Icons of the package that we imported AwesomeIcons in pubspec.yaml
  List<IconData> _icons =[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,

  ];

  // _buildIcon() function that returns a Widget
  Widget _builderIcon(int index) {
    return GestureDetector(

      onTap: () {
        setState(() {
          selected = index;
          print("you selected icon $index");
        });
      },

      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(

          //condition for selecting icon
          color: index == selected
          ?Theme.of(context).accentColor 
          : Color(0xFFE7EBEE), 

          borderRadius: BorderRadius.circular(30.0)
          ),
        child: Icon(
          _icons[index],
          size: 25.0,

          //condition for selecting icon
          color: index == selected
          ?Theme.of(context).primaryColor 
          : Color(0xFFB4C1C4),
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        // List of the main app starts here
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),

              // First widget of the home screen
              child: Text(
                "What would you like to find?", 
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                )
                ),
            ),

            // SizedBox 
            SizedBox(height: 20.0),

            //Calling the function _builderIcon(0) and passing the int 0 i.e. index[0] of the List - _icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
              .asMap()
              .entries
              .map((MapEntry map) => _builderIcon(map.key),
              )
              .toList(),
            ),


            //Sizedbox for extra spacing
            SizedBox(height: 20.0),

            //calling the Destination Carousel class
            DestinationCarousel(),

            //Sizedbox for extra spacing
            SizedBox(height: 20.0),

            //calling the Hotel Carousel class
            HotelCarousel(),



      ],
      )
      ),

      // Bottom Navigation bar
      bottomNavigationBar: BottomNavigationBar(        
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [

          //Item 1
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
            size: 30.0
            ),
            title: SizedBox.shrink(),
          ),
          
          //Item 2
           BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza,
            size: 30.0
            ),
            title: SizedBox.shrink(),
          ),

          //Item 3
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0, 
              backgroundImage: AssetImage(
                "assets/images/venice.jpg"
                ),
                ),                       
            title: SizedBox.shrink(),
          ),
        ],
      ),
      
    );
  }
}