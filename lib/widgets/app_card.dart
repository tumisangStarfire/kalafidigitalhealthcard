import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {  
  final Widget child; 

  AppCard({Key key,@required this.child}) : super(key:key);
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch, 
      children:[ 
        Card( 
          margin: EdgeInsets.all(20.0), 
          color: Colors.blueAccent, 
          child: Container(padding:EdgeInsets.all(20.0), 
          child: widget.child,
           decoration: BoxDecoration(
             color: Colors.white,
             border: Border.all(color: Colors.blueAccent,width: 2)

           ),
          )
        )
      ],

    );
  }
}