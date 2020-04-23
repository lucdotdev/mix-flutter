import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  Icon(
          Icons.search,
          color: Colors.black,


        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
                Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),

      body: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'A la une',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xffff6702),
            ),
          ),
        ),
          TabBar(
            tabs: [
              Text('Chretienne'),
              Text('house'),
            ],
            isScrollable: false,

            labelColor: Colors.black,
            labelStyle: new TextStyle(
                fontSize: 20
            ),
            unselectedLabelColor: Colors.white30,
            indicatorColor: Colors.transparent,
            unselectedLabelStyle: new TextStyle(
                fontSize: 15
            ),
          ),
          TabBarView(
            children: <Widget>[
              Container(),
              Container()
            ],
          ),
        ],
      )
    );
  }
}
