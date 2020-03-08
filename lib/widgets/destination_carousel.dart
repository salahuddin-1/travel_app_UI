import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/screens/destination_screen.dart';
import 'package:travel_app/screens/see_all_destination.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          //Row for the Exclusive hotel and See all
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Destinations",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )),
              GestureDetector(
                onTap: () =>
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SeeAllDestination(
                    // destination: destinations[index],
                  ))
                ),
                child: Text("See All",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    )),
              ),
            ],
          )),

      // Container blue which have two more containers in it
      Container(
          height: 300.0,
          //color: Colors.blue,

          //Containers child list view builder
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index) {
                //Creating variable destinations[index] = destination
                Destination destination = destinations[index];

                // Returning another Container red
                return GestureDetector(

                  //Going to another Screen
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DestinationScreen(
                        destination: destination,
                      ),
                    ),
                  ),
                  child: Container(
                      margin: EdgeInsets.all(10.0),
                      //color: Colors.red,
                      width: 210.0,

                      //Conatiners red child Stack widget which helpls to overlap other widgets
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          //Stacks children (1st child is another Container white)
                          //For giving them the proper position
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                              height: 120.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),

                              // Container white's child Column
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //Destination activities
                                    Text(
                                      '${destination.activities.length} activities',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),

                                    // Destination description
                                    Text(
                                      destination.description,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //Stacks 2nd child
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  )
                                ]),

                            //Image
                            child: Stack(
                              children: <Widget>[
                                //Stack child 1

                                //Hero widget for animation
                                Hero(
                                  tag: destination.imageUrl,

                                  //Hero widget child
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      height: 180.0,
                                      width: 180.0,
                                      image: AssetImage(destination.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Stack child 2
                                Positioned(
                                    left: 10.0,
                                    bottom: 10.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(destination.city,
                                            style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white)),

                                        //Stack child 3
                                        Row(children: <Widget>[
                                          Icon(FontAwesomeIcons.locationArrow,
                                              color: Colors.white70, size: 10.0),
                                          SizedBox(width: 5.0),
                                          Text(
                                            destination.country,
                                            style:
                                                TextStyle(color: Colors.white70),
                                          )
                                        ]
                                      ),
                                    ],
                                  )
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              }))
    ]);
  }
}
