import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenGate extends StatefulWidget {
  @override
  State<OpenGate> createState() => _OpenGateState();
}

class _OpenGateState extends State<OpenGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(
            CupertinoIcons.home,
            size: 50,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Colors.red[500],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      print('Center Button Pressed');
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 183, 184, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.lock,
                          color: Colors.blue,
                          size: 90,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
