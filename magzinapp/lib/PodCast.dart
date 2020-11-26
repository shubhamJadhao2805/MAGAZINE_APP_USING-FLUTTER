import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'globals.dart';

class PodCast extends StatefulWidget {
  @override
  _PodCastState createState() => _PodCastState();
}

class _PodCastState extends State<PodCast> {
  @override
  Widget build(BuildContext context) {
    void showPodCastPlayer(BuildContext context, int index) {
      showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          context: context,
          builder: (ctx) {
            return MyAudioPlayerControler();
          });
    }

    return Container(
      margin: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return Card(
            elevation: 3,
            child: InkResponse(
              child: Container(
                child: Center(
                  child: Icon(
                    Icons.surround_sound,
                    size: 100,
                  ),
                ),
                height: 150,
                color: Colors.grey[300],
              ),
              onTap: () {
                showPodCastPlayer(context, index);
              },
            ),
          );
        },
      ),
    );
  }
}

class MyAudioPlayerControler extends StatefulWidget {
  @override
  _MyAudioPlayerControlerState createState() => _MyAudioPlayerControlerState();
}

class _MyAudioPlayerControlerState extends State<MyAudioPlayerControler> {
  AudioPlayer advancedPlayer = new AudioPlayer();

  int _value = 0;
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    advancedPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        _value = event.inSeconds;
      });
    });
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red]),
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              elevation: 10,
              child: Container(
                child: Center(
                  child: Icon(
                    Icons.hearing,
                    size: 150,
                    color: Colors.grey[700],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TypewriterAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Discipline is the best tool",
                    "Design first, then code",
                    "Do not patch bugs out, rewrite them",
                    "Do not test bugs out, design them out",
                  ],
                  textStyle: TextStyle(
                      fontSize: 20.0, fontFamily: "Agne", color: Colors.white),
                  textAlign: TextAlign.start,
                  speed: Duration(milliseconds: 150),
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            SliderTheme(
              data: SliderThemeData(
                thumbColor: Colors.white,
                activeTickMarkColor: Colors.white,
                activeTrackColor: Colors.white,
              ),
              child: Slider(
                min: 0,
                max: 200,
                value: _value + 0.0,
                onChanged: (value) {
                  setState(() {
                    _value = value.round();
                    advancedPlayer.seek(Duration(seconds: _value));
                  });
                },
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 30,
                  splashColor: Colors.redAccent,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30,
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isPlaying) {
                        advancedPlayer.pause();
                        isPlaying = false;
                      } else {
                        isPlaying = true;
                        advancedPlayer.resume();
                      }
                    });
                  },
                ),
                IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
