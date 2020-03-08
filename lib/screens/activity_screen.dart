import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/activity_model.dart';

class ActivityScreen extends StatefulWidget {
  final Activity activity;

  ActivityScreen({this.activity});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
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
                height: MediaQuery.of(context).size.width,
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
                    image: AssetImage(widget.activity.imageUrl),
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
                        child: Text(widget.activity.name,
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w600)),
                      ),

                      //Text activity type
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(widget.activity.type,
                            style: TextStyle(
                              fontSize: 17.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600)),
                      ),

                        
                        SizedBox(height: 6.0),

                      // calling the stars method rating
                      buildStars(),

                      // 

                      // Timings
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Row(
                          children: <Widget>[
                            //Timing 0
                            Container(
                              padding: EdgeInsets.all(7.0),
                              child: Text(widget.activity.startTimes[0],
                              style: TextStyle(fontSize: 16.0),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).accentColor,
                              ),
                              width: 90.0,
                              alignment: Alignment.center,
                            ),

                            SizedBox(width: 6.0),

                            // Timing 1
                            Container(
                              padding: EdgeInsets.all(7.0),
                              child: Text(widget.activity.startTimes[1],
                              style: TextStyle(fontSize: 16.0),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).accentColor,
                              ),
                              width: 90.0,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.0),

                      // Text activity price
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(
                          '\$ ${widget.activity.price}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 21.0),
                        ),
                      ),

                      // Text per pax
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text("per pax",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.grey)),
                      ),

                      SizedBox(height: 8.0),

                      // Divider
                      Divider(),

                      // Text activity description
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(widget.activity.descript,
                        
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
