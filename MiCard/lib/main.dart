import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}
class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/milk-box.png'),

            ),
            Text('Le Anh Thu', style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),

            Text('FLUTTER DEVELOPER',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.teal.shade100,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),),
            Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.phone,
                      color: Colors.teal),
                  title: Text(
                    '+123456789',
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Roboto',
                        fontSize: 20.0
                    ),
                  )
                  ,)

            ),

            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(Icons.email,
                    color: Colors.teal),
                title: Text(
                  'thule@gmail.com',
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Roboto',
                      fontSize: 20.0
                  ),
                )
                ,)

            ),
          ],
        )),
      )

    );
  }
}

