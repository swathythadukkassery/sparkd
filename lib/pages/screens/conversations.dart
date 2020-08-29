import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  @override
  final String recordName;
  const ConversationScreen(this.recordName);

  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        backgroundColor: Color(0xff145C9E),
        title: Text(widget.recordName),
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color(0x54FFFFFF),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      // controller: searchTextEditingController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: TextStyle(color: Colors.white54),
                        // border: InputBorder.none,
                      ),
                    )),
                    GestureDetector(
                      onTap: () {
                        // InitiateSearch();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0x36000080),
                                const Color(0x36ffffff),
                              ]),
                              borderRadius: BorderRadius.circular(40)),
                          padding: EdgeInsets.all(12),
                          child: Image.asset('assets/images/send2.png')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
