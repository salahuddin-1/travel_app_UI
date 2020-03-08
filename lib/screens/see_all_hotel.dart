import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/models/hotel_model.dart';
import 'package:travel_app/screens/hotel_screen.dart';

import 'destination_screen.dart';

class SeeAllHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Listview builder
        body: ListView.builder(
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              Hotel hotel = hotels[index];

              // Returning a Stack
              return GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HotelScreen(
                          hotel: hotel,
                        ))),
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

                    //Stacks 2nd child [Image]
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        child: Image(
                          fit: BoxFit.cover,
                          // height: 50.0,
                          width: 160.0,
                          image: AssetImage(hotel.imageUrl),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),

                    

                    //Stacks 3rd child [Name] and [Address] and [Description]
                    Positioned(
                      right: 15.0,
                      top: 30.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          //Columns 1st child
                          Container(
                            margin: EdgeInsets.only(right: 7.0),
                            // color: Colors.blue,
                            width: 180,

                            //Columns 1st child's 1st child [Row]
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[

                                // Rows 1st child
                                Container(
                                  // color: Colors.blue,
                                  width: 140,
                                    child: Text(hotel.name,
                                      overflow: TextOverflow.visible,
                                      maxLines: 4,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600)),
                                ),

                                //Rows 2nd child
                                Container(
                                  // color: Colors.blue,                                  
                                   width: 40.0,
                                  height: 30.0,
                                  child: Text('\$ ${hotel.price}/night',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w600
                                    
                                  ),),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 3.0),

                          // Columns 2nd child [Address] 
                          Container(
                            // color: Colors.blue,
                            width: 180.0,
                            child: Text(
                              hotel.address,
                              overflow: TextOverflow.visible,
                              maxLines: 4,
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),

                          SizedBox(height: 10.0),

                          // Columns 3rd child [Description]
                          Container(
                            // color: Colors.blue,
                            width: 180.0,
                            child: Text(
                              hotel.description,
                              overflow: TextOverflow.visible,
                              maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13.0),
                            ),
                          ),
                        ],
                      ),
                                      
                    ),
                  ],
                ),
              );
            }));
  }
}
