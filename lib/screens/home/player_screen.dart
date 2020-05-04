import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';


class PlayerScreen extends StatefulWidget {
  final title;
  final path;

  PlayerScreen({@required this.title, @required this.path,});
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final _volumeSubject = BehaviorSubject.seeded(1.0);
  final _speedSubject = BehaviorSubject.seeded(1.0);
  AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player
        .setUrl(
       "https://www.republikville.com/_media/_chanson/_musiques/Altachone%20Mawa_Confinement_m0yrejtp.mp3")
        .catchError((error) {
      // catch audio error ex: 404 url, wrong url ...
      print(error);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(

            icon: Icon(Icons.arrow_back_ios, color: Color(0xffff6702)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text("Mix",
              style: TextStyle(color:  Color(0xffff6702),)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu, color: Color(0xffff6702)),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color:  Color(0xffff6702).withOpacity(.5),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: null
                          ,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipOval(
                              clipper: MClipper(),
                              child: Image.network(
                                widget.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
    Column(
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                            color:  Color(0xffff6702),
                            fontSize: 20.0,
                           ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "The Weeknd",
                        style: TextStyle(
                            color:  Color(0xffff6702),
                            fontSize: 18.0,
                           ),
                      )
                    ],
                  ),
              SizedBox(
                height: 5.0,
              ),
              Text("Track position"),
              StreamBuilder<Duration>(
                stream: _player.durationStream,
                builder: (context, snapshot) {
                  final duration = snapshot.data ?? Duration.zero;
                  return StreamBuilder<Duration>(
                    stream: _player.getPositionStream(),
                    builder: (context, snapshot) {
                      var position = snapshot.data ?? Duration.zero;
                      if (position > duration) {
                        position = duration;
                      }
                      return SeekBar(
                        duration: duration,
                        position: position,
                        onChangeEnd: (newPosition) {
                          _player.seek(newPosition);
                        },
                      );
                    },
                  );
                },
              ),
              StreamBuilder<FullAudioPlaybackState>(
                  stream: _player.fullPlaybackStateStream,
                  builder: (context, snapshot) {
                  final fullState = snapshot.data;
                  final state = fullState?.state;
                  final buffering = fullState?.buffering;
                  return Container(
                    width: 350.0,
                    height: 150.0,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 65.0,
                            width: 290.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffff6702), width: 3.0),
                                borderRadius: BorderRadius.circular(40.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.fast_rewind,
                                      size: 55.0, color:  Color(0xffff6702)),
                                  state == AudioPlaybackState.connecting || buffering == true ?
                                  Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                    ),
                                  ): state == AudioPlaybackState.playing ?
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 92.0,
                                      height: 92.0,
                                      decoration: BoxDecoration(
                                          color:  Color(0xffff6702), shape: BoxShape.circle),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.pause,
                                          size: 45.0,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ) :  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 92.0,
                                      height: 92.0,
                                      decoration: BoxDecoration(
                                          color:  Color(0xffff6702), shape: BoxShape.circle),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.play_arrow,
                                          size: 45.0,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),

                                  Icon(Icons.fast_forward,
                                      size: 55.0, color:  Color(0xffff6702))
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                }
              ),
              Container(
                height: 190.0,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: -25,
                      child: Container(
                        width: 50.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                            color:  Color(0xffff6702),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0))),
                      ),
                    ),
                    Positioned(
                      right: -25,
                      child: Container(
                        width: 50.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                            color:  Color(0xffff6702),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0))),
                      ),
                    ),
                    // Center(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: <Widget>[
                    //       song("assets/cover_01.jpg", "Never say",
                    //           "Believe 2012"),
                    //       song("assets/cover_02.jpg", "Beauty...",
                    //           "Believe 2012"),
                    //       song("assets/cover_03.png", "Boyfriend",
                    //           "Believe 2012"),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget song(String image, String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          width: 40.0,
          height: 40.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color:  Color(0xffff6702))),
            Text(subtitle, style: TextStyle(color:  Color(0xffff6702)))
          ],
        )
      ],
    ),
  );
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }



}
class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}


class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: widget.duration.inMilliseconds.toDouble(),
      value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
      onChanged: (value) {
        setState(() {
          _dragValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged(Duration(milliseconds: value.round()));
        }
      },
      onChangeEnd: (value) {
        _dragValue = null;
        if (widget.onChangeEnd != null) {
          widget.onChangeEnd(Duration(milliseconds: value.round()));
        }
      },
    );
  }
}
