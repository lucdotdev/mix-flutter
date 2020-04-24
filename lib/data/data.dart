import 'dart:convert' ;
import 'package:flutter/services.dart';

class Music {
  final title;
  final path;
  Music(this.title, this.path);
}

Future getmusic() async{

  final jsonData = await json.decode(
      await rootBundle.loadString('assets/data.json')
  );

  List<Music> musics = [];
  for(var u in jsonData){
    Music music = Music(
        u["title"],
        u["path"]
    );
    musics.add(music);
  }
  return musics;
}