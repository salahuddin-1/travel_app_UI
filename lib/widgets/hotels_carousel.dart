import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel_model.dart';
import 'package:travel_app/screens/hotel_screen.dart';
import 'package:travel_app/screens/see_all_hotel.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          //Row for the Exclusive hotel and See all
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Exclusive Hotels",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SeeAllHotel(
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
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) {
                //Creating variable destinations[index] = destination
                Hotel hotel = hotels[index];

                // Returning another Container red
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotel,))
                  ),
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      //color: Colors.red,
                      width: 310.0,

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
                              width: 310.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),

                              // Container white's child Column
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  
                                  children: <Widget>[
                                    //Destination activities
                                    Text(
                                      hotel.name,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),

                                    SizedBox(height: 2.0),

                                    // Destination description
                                    Text(
                                      hotel.address,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),

                                    SizedBox(height: 2.0),

                                    Text('\$ ${hotel.price}/night',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0)
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 180.0,
                                width: 290.0,
                                image: AssetImage(hotel.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      )),
                );
              }))
    ]);
  }
}

 