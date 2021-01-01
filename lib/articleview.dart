import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Articleview extends StatefulWidget {
  final String newsurl;
  Articleview({this.newsurl});
  @override
  _ArticleviewState createState() => _ArticleviewState();
}

class _ArticleviewState extends State<Articleview> {

  final Completer<WebViewController> completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Mobile' ,style:TextStyle(
                  fontSize:40.0,
                  color:Colors.blueAccent)),
              Text(' Tak',
                style:TextStyle(
                    color: Colors.indigo,
                    fontSize: 30.0

                ),
              ),
              Text('',
                style:TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 30.0

                ),
              ),

            ],
          )
      ),
      body:Container(

        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width,
      child: Container(
        child:WebView(
          initialUrl:widget.newsurl ,
          onWebViewCreated: ((WebViewController webViewController){
            completer.complete(webViewController);
          }),
        )
      ),
      ),
    );
  }
}




