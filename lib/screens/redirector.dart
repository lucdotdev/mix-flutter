import 'package:flutter/cupertino.dart';
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
          GestureDetector(
            onTap: ()=>{},
            child: Container(
              width: width-width/10,
              height: heigth/18,
              decoration: BoxDecoration(
                color: Color(0xffff6702),
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              alignment: Alignment.center,
              child: Text('Créer un compte',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width/20,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          ///
          ///

          SizedBox(
            height: heigth / 30,
          ),

          ///LOGIN BUTTON
          ///
          ///
          GestureDetector(
            onTap:()=>{
              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (context) => new RedirectorScreen()))
            },
            child: Container(
              width: width-width/10,
              height: heigth/18,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(12),

                  ),
                border: Border.all(
                    color: Colors.white,
                  width: 3
                ),
              ),
              alignment: Alignment.center,
              child: Text('Connexion',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width/20,
                      fontWeight: FontWeight.w400)),
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
