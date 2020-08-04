import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'video.dart';

void main() => runApp(Myapp());
AudioPlayer audioPlayer = new AudioPlayer();
var ap = new AudioCache(fixedPlayer: audioPlayer);
playonline() async {
  ap.clearCache();
  await audioPlayer.play(
      'https://bit.ly/30sn9lh');
}
playlocal() {
  ap.clearCache();
  ap.play('audio.mp3');
}

pause() {
  audioPlayer.pause();
}

stop() {
  audioPlayer.stop();
}

class Myapp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(80.0), 
        child:AppBar(
          title:
          Text(
            "My Songs",
            style: TextStyle(
              color: Colors.red,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              ),           
            ),
            backgroundColor:Colors.black,

            actions: <Widget>[
              
              Icon(Icons.search),
              Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
           child: Icon(Icons.account_circle),
        ),
              ],
            leading: Icon(Icons.menu),
            elevation: 100,
          centerTitle: true,
        ),
        ),
        body:
         Container(
          alignment: Alignment.center,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
          
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:0),
                child: Text(
                  'Downloaded songs',
                  style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.red,
                fontFamily: 'Georgia',),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top:8),
              child: Container(
                width:200,
                height:200,
                decoration: BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/download.jpg"), fit: BoxFit.cover,),
            color: Colors.blue[50],
            shape: BoxShape.circle
          ),
                  child: Row( children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: IconButton(
                          icon: Icon(Icons.skip_previous),
                          color: Colors.red,
                          
                          onPressed: playlocal,
                          iconSize: 35,
                        ),
                    ),

                      Padding(
                        padding: const EdgeInsets.only(left:15),
                        child: IconButton(
                          icon: Icon(Icons.play_circle_filled),
                          color: Colors.red,
                          onPressed: pause,
                          iconSize: 35,
                        ),
                      ),

                       Padding(
                         padding: const EdgeInsets.only(left:15),
                         child: IconButton(
                          icon: Icon(Icons.skip_next),
                          color: Colors.red,
                          onPressed: stop,
                          iconSize: 35,
                      ),
                       ),

                       

                  ],

                  ),
              ),
              ),
             Padding(
                padding: const EdgeInsets.only(top:10),
                child: Text('Play Online Song/Video',
                style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.red,
                fontFamily: 'Georgia',),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top:20),
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.tealAccent
                ),
                margin: EdgeInsets.only(right: 30, left: 30),
                  width: double.infinity,
                  height: 60,
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:100),
                      child: IconButton(
                          icon: Icon(Icons.audiotrack),
                          focusColor: Colors.black,
                          onPressed: playonline,
                          iconSize: 35,
                        ),
                    ),

                      IconButton(
                        icon: Icon(Icons.play_circle_filled),
                        onPressed: pause,
                        iconSize: 35,
                      ),

                       IconButton(
                       icon: Icon(Icons.ondemand_video),
                        onPressed: stop,
                        iconSize: 35,
                      ),
                  ],),
              ),
              
              ),

Padding(
                padding: const EdgeInsets.only(top:20,right: 20,left: 20),
                child: new SamplePlayer1(),


              ),
            ],
          
          )

        )
        
        ),
      );
  }
}