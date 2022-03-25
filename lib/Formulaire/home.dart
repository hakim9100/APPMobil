import 'package:flutter/material.dart';
import 'package:flutter_application_4/Formulaire/authentication.dart';
import 'package:flutter_application_4/Formulaire/calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as Path;
import 'package:path/path.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              SchearSection(),
              SizedBox(height: 40),
              plan,
              HotelSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'HomePage',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.home,
            color: Colors.grey,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.place,
            color: Colors.grey,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<Authentication>().signOut();
          },
          icon: Icon(
            Icons.lock_outline,
            color: Colors.grey,
            size: 30,
          ),
        ),
      ],
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}

class SchearSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'London',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20)),
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(25)),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CalendarPage();
                    },
                  ),
                );
              },
              child: Icon(Icons.search),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget plan = Container(
    child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose a date',
              style: GoogleFonts.nunito(color: Colors.grey, fontSize: 15)),
          Text('20 janvier - 11 février',
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 17,
              ))
        ],
      ),
    ),
    Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Number of Rooms',
                style: GoogleFonts.nunito(color: Colors.grey, fontSize: 15)),
            Text('1 Room - 2 Adults',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 17,
                )),
          ],
        )),
  ],
));

class HotelSection extends StatelessWidget {
  final List hotelList = [
    {
      'title': 'Grand Royl Hotel',
      'place': 'Webley, London',
      'distance': 2,
      'review': 36,
      'picture': 'images/hotel1.jpg',
      'price': '100',
    },
    {
      'title': 'Cordoba Center',
      'place': 'Webley, London',
      'distance': 5,
      'review': 20,
      'picture': 'images/hotel2.jpg',
      'price': '130',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 50,
            child: Row(
              children: [
                Text('530 Hotels founds',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 15,
                    )),
                Row(
                  children: [
                    Text(
                      'Filters',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.filter_list_outlined,
                          color: Colors.lightBlue,
                          size: 15,
                        ))
                  ],
                )
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;
  HotelCard(this.hotelData);

  set rating(double rating) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(
                  hotelData['picture'],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 5,
                    right: -15,
                    child: MaterialButton(
                      color: Colors.white,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['title'],
                  style: GoogleFonts.nunito(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$' + hotelData['price'],
                  style: GoogleFonts.nunito(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['place'],
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.lightBlueAccent,
                      size: 16.0,
                    ),
                    Text(
                      hotelData['distance'].toString() + 'km to city',
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate,
                        color: Colors.blueAccent,
                        size: 14,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Colors.blueAccent,
                        size: 14,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Colors.blueAccent,
                        size: 14,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Colors.blueAccent,
                        size: 14,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.blueAccent,
                        size: 14,
                      ),
                      Text(
                        hotelData['review'].toString() + 'reviews',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
