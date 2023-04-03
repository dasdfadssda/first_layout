import 'package:flutter/material.dart'; // import Flutter Material library

void main() {
  runApp(const MyApp()); // run the app
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // build method to create the widget tree
    return const MaterialApp( // create a Material app with const arguments
      title: 'We are Pard', // set the app's title
      home: MyHomePage(), // set the app's home page
    );
  }
}

class MyHomePage extends StatefulWidget { // create a stateful widget
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(); // create a state object
}

class _MyHomePageState extends State<MyHomePage> { // create a state object for the home page
  bool _isFavorited = false; // initialize a boolean variable

  void _toggleFavorite() { // function to toggle the favorite icon
    setState(() { // set state to update the icon
      _isFavorited = !_isFavorited; // toggle the value of _isFavorited
    });
  }

  @override
  Widget build(BuildContext context) { // build method to create the widget tree
    Widget titleSection = Container( // create a container widget
      padding: const EdgeInsets.all(32), // set padding for the container
      child: Row( // create a row widget
        children: [
          Expanded( // create an expanded widget to fill remaining space
            child: Column( // create a column widget
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'PARD', // display the text "PARD"
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'handong-it-club', // display the text "handong-it-club"
                  style: TextStyle(
                    color: Colors.grey[500], // set text color to gray
                  ),
                ),
              ],
            ),
          ),
          IconButton( // create an icon button widget
            icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border), // display a star icon if _isFavorited is true, otherwise display an empty star icon
            color: Colors.red[500], // set the icon color to red
            onPressed: _toggleFavorite, // call the _toggleFavorite function when the button is pressed
          ),
          const Text('41'), // display the text "41"
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor; // get the primary color from the app's theme

    Widget buttonSection = Row( // create a row widget
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // evenly space the children
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'), // create a button column widget
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'), // create a button column widget
        _buildButtonColumn(color, Icons.share, 'SHARE'), // create a button column widget
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '파드, 우리의 꿈을 이루기 위해 끊임없이 전진합니다!\nPARD는 IT와 벤처 스타트업에 관심이 있고 \nPay it forward를 실천하고자 하는 대학생들이 모인 학부 연합 IT/벤처 동아리입니다',
        softWrap: true,
      ),
    );

    Widget _divider = Divider(thickness: 1, height: 1, color: Colors.grey); // 구분선

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('We are PARD'),
        ),
        body: ListView( 
          children: [
            Image.asset(
              'assets/img.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover, // 지정된 영역을 비율을 맞추어 채운다.
            ),
            titleSection,
            _divider,
            buttonSection,
            _divider,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min, // 크기 만큼만 차지 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
