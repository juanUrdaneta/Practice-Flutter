import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlyChatApp());
}

const String _name = "Juan Urdaneta"; 

class FriendlyChatApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      title:"FriendlyChat",
      home: new ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override 
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text){
    _textController.clear();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                  hintText: "Write a Message"
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: ()=>_handleSubmitted(_textController.text)
              ),
            ),
          ],
        ),
      ) ,
    );
    
  }

  @override 
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FriendlyChat")
      ),
      body: _buildTextComposer(),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;

  @override 
  Widget build(BuildContext context){
    return new Container (
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: EdgeInsets.only(top:5.0),
                child: Text(text),
              )
            ],
          ),
        ],
      )
    );
  }
}