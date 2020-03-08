import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/models/hotel_model.dart';


class HotelScreen extends StatefulWidget {
  //   final Activity activity;

  // HotelScreen({this.activity});

  // Activites variables that calls a list named activities
   static final index = 0;
   final Activity activity = activities[index];

  // Activites variables that calls a list named activities
   final Hotel hotel; //= hotels[index];

   HotelScreen({this.hotel});

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
 
  buildStars() {
    String stars = '';

    for (int i = 0; i < widget.activity.rating; i++) {
      stars = stars + '* ';
    }
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.0),
        child: Text(
          stars,
          style: TextStyle(
              color: Colors.yellow,
              fontSize: 35.0,
              fontWeight: FontWeight.bold),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Column first the base
      body: Column(
        children: <Widget>[
          //first child of column
          Stack(
            children: <Widget>[
              //first child of stack
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6.0,
                          offset: Offset(0.0, 2.0))
                    ]),

                //image
                child: ClipRRect(
                  child: Image(
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.hotel.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),

              //Second child of stack
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Icon arrow back
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      iconSize: 25.0,
                    ),

                    Row(
                      children: <Widget>[
                        //Icon Search
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.search),
                          color: Colors.black,
                          iconSize: 25.0,
                        ),

                        //Icon Sort
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          color: Colors.black,
                          iconSize: 25.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          //Second child of column
          Expanded(
            child: Container(
              //height: double.infinity,
              margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0),
              //alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white),

              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Text activity name
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(widget.hotel.name,
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w600)),
                      ),

                  

                        
                        SizedBox(height: 6.0),

                      // Text hotel address
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(widget.hotel.address,
                        style: TextStyle(color: Colors.grey)
                        
                        ),
                      ),

                      // calling the stars method rating
                      buildStars(),

                      // 

                      

                      SizedBox(height: 10.0),

                      // Text activity price
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(
                          '\$ ${widget.hotel.price}/night',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 21.0),
                        ),
                      ),


                      SizedBox(height: 8.0),

                      // Divider
                      Divider(),

                      // Text hotel address
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(widget.hotel.description,
                        
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  }
