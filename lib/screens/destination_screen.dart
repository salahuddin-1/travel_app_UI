import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';

import 'activity_screen.dart';

class DestinationScreen extends StatefulWidget {
  //Variables
  final Destination destination;
  

  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  // Function for ratings
  Text buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars = stars + '* ';
    }
    stars.trim();

    //Returning a text widget with a '*'
    return Text(
      stars, 
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.yellow,
        fontWeight: FontWeight.w600
        ),

      );

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // First Widget of the scaffold
      body: Column(
        children: <Widget>[

          //Returning a stack
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ]),

                //Hero widget for animation
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(
                        widget.destination.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Back Arrow on the top
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      iconSize: 25.0,
                    ),

                    //Search buttons and sort icons
                    Row(
                      children: <Widget>[
                        //Search icon
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.search),
                          color: Colors.black,
                          iconSize: 25.0,
                        ),

                        //Sort Icon
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          color: Colors.black,
                          iconSize: 20.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // City and Country name and location icon
              Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // City name
                      Text(widget.destination.city,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          )),

                      // Location arrow icon
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.white70,
                            size: 11.0,
                          ),

                          //for spacing
                          SizedBox(width: 10.0),

                          //Country name
                          Text(widget.destination.country,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15.0)),
                        ],
                      ),
                    ],
                  )),

              // Right sie icon of location
              Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Icon(
                    Icons.location_on,
                    size: 25.0,
                    color: Colors.white70,
                  ))
            ],
          ),

          // Second child of column returning  a Listview
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {

                  // Variables
                  Activity activity = widget.destination.activities[index];

                  // Returning  a stack
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ActivityScreen(
                            activity: activity,
                          ))
                        ),
                    child: Stack(
                      children: <Widget>[

                        // Main Container white that contains the image and all the text 
                        Container(
                          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                          height: 170.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),


                          child: Padding(
                            padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    
                                    Container(                                    
                                      width: 120.0,

                                      // Activity name
                                      child: Text(
                                        activity.name,
                                        maxLines: 2,
                                        
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        
                                        ),
                                    ),

                                    Column(
                                      children: <Widget>[

                                        // Text Activity price
                                        Text(
                                          '\$ ${activity.price}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600
                                          ),
                                          ),

                                        // Text per pax
                                        Text(
                                          'per pax',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600
                                          ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),

                                // Text activity type
                                Text(
                                  activity.type,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  
                                  ),

                                // Returning  the function 
                                buildRatingStars(activity.rating),
                                

                                //For some space
                                SizedBox(height: 10.0),

                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.center,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      // Text start times [0]
                                      child: Text(
                                        activity.startTimes[0],
                                      ),
                                    ),

                                    SizedBox(width: 10.0),

                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.center,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      // text start time [1]
                                      child: Text(
                                        activity.startTimes[1],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        // Image 
                        Positioned(
                          left: 20.0,
                          top: 15.0,
                          bottom: 15.0,
                          child: ClipRRect(
                            
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              fit: BoxFit.cover,
                              width: 110.0,
                              image: AssetImage(
                                activity.imageUrl
                              ),
                            ),
                            
                          ),
                        )


                      ],
                    ),
                  );
                }
                ),
          ),
        ],
      ),
    );
  }
}
