import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final String direction;

  FadeAnimation({@required this.delay, @required this.child, this.direction});

  @override
  Widget build(BuildContext context) {
    
    _getdirection(){
      if(direction=="x"){
          return "translateX";
      }else if (direction=="y"){
         return "translateY";
      } else{
        return "translateX";
      }
     
    }
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track(_getdirection()).add(
          Duration(milliseconds: 500), Tween(begin: 130.0, end: 0.0),
          curve: Curves.easeIn)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation[_getdirection()]),
            child: child
        ),
      ),
    );
  }
}
