import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/screens/destination_screen.dart';

class SeeAllDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Listview builder
        body: ListView.builder(
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];

              // Returning a Stack
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DestinationScreen(
                    destination: destination,
                  ))
                ),
                child: Stack(
                  children: <Widget>[
                    //Stacks 1st child
                    Container(
                      
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 180.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),

                    //Stacks 2nd child
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        child: Image(
                          fit: BoxFit.cover,
                          // height: 50.0,
                          width: 160.0,
                          image: AssetImage(destination.imageUrl),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),

                    //Stacks 3rd child
                    Positioned(
                      left: 30.0,
                      bottom: 34.0,
                      child: Text(
                        destination.city,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                    //Stacks 4th child
                    Positioned(
                      left: 30.0,
                      bottom: 20.0,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.white70,
                            size: 8.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            destination.country,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Stacks 4th child
                    Positioned(
                      right: 110.0,
                      top: 30.0,
                      child: Text(
                        '${destination.activities.length} activities:',
                        style: TextStyle(
                          fontSize: 18.0,
                          
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ),

                    //Stacks 4th child
                    Positioned(
                      right: 30.0,
                      top: 60.0,
                      child: Container(
                        // color: Colors.blue,
                        width: 170.0,
                        child: Text(
                          destination.description,
                          overflow: TextOverflow.visible,
                          maxLines: 4,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.0
                          ),
                          
                        ),
                      ),
                    ),


                    


                  ],
                ),
              );
            }));
  }
}
