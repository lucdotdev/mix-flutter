import 'package:flutter/material.dart';


class RedirectorScreen extends StatefulWidget {
  @override
  _RedirectorScreenState createState() => _RedirectorScreenState();
}

class _RedirectorScreenState extends State<RedirectorScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.jpg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ///Login Title
          ///
          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Text(
                'Ecoutez de la bonne musique Soutenez vos artiste favoris Publier votre musique en ligne',
                textAlign: TextAlign.center,
                style:
                    new TextStyle(color: Colors.white, fontSize: width / 15),
              ),
            ),
          ),

          ///Signup buttton
          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width - width / 10,
              height: heigth / 20,
              child: RaisedButton(
                onPressed: () => {},
                color: Color(0xffff6d0d),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Creer votre Compte',
                  style: TextStyle(color: Colors.white, fontSize: width / 15),
                ),
              ),
            ),
          ),

          ///
          ///Signup buttton

          ///Space
          ///
          SizedBox(),

          ///
          ///Space
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Continuer avec Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          ///Login button
          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width - width / 10,
              height: heigth / 20,
              child: RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    'Connexion',
                    style: TextStyle(color: Colors.white, fontSize: width / 15),
                  ),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.white))),
            ),
          ),

          ///
          ///Login button
          SizedBox(
            height: heigth / 20,
          )
        ],
      ),
    ));
  }
}
