import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/loading.dart';
import 'package:mix/data/data.dart';
import 'package:mix/screens/home/player_screen.dart';

class MyTabView extends StatefulWidget {
  @override
  _MyTabViewState createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(width / 15),
          child: SizedBox(
            height: height/2.7,
            child: FutureBuilder(
                future: getmusic(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  GestureDetector(
                            onTap: ()=>{
                              Navigator.of(context).push(   new MaterialPageRoute(builder: (context) => new PlayerScreen(title: snapshot.data[index].title ,path: snapshot.data[index].path, )))
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Column(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child:  Image.network(

                                    snapshot.data[index].path,
                                     width: width/3,
                                    ),
                                  ),
                                  SizedBox(height: height/100,),
                                  new Text(
                                    snapshot.data[index].title.length > 20 ? snapshot.data[index].title.substring(0,20).toUpperCase() +' ...' :   snapshot.data[index].title.toUpperCase(),
                                    overflow: TextOverflow.clip,
                                    maxLines: 5,
                                    style: new TextStyle(
                                        color:Colors.black
                                    ),

                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return CircularProgressIndicator(

                  );
                }),
          ),
        )
      ],
    );
  }
}
