import 'package:classapp/Utils/generate_random_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 1.0),
      child: Card(
        color: randomColors(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Electric Machines",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        "EEE 311",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ]),
                Spacer(),
                Icon(Icons.offline_pin),
                Text(" ")

              ]),
              Spacer(),
              Row(children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:4.0, right: 4.0),
                      child: Icon(Icons.alarm),
                    ),
                    Column(
                      children: <Widget>[
                        Text("10-12AM",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        Text("2 hours",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    Text(" "),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:4.0, right: 4.0),
                          child: Icon(Icons.location_on),
                        ),
                        Text("EE 3rd yr class",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ],
                    ),
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
