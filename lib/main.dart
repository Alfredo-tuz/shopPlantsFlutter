import 'package:flutter/material.dart';
import 'package:shop_plants/plantlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
 
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
     body: ListView(
       children: <Widget>[
         SizedBox(height:15.0),
         Container(
           width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.only(right: 10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               IconButton(icon: Icon(Icons.menu), 
               onPressed: (){

               }
              ),
              FloatingActionButton(
                onPressed: (){

                },
                backgroundColor: Colors.grey.withOpacity(0.3),
                mini: true,
                elevation: 0.0,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 17.0,
                ),
              )
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(14.0),
           child: Text('Top picks',
           style: TextStyle(
             fontSize: 40.0,
             fontWeight: FontWeight.w500
           ),
           ),
         ),
         Padding(padding: EdgeInsets.only(left:15.0),
         child: TabBar(
           controller:tabController,
           indicatorColor: Colors.transparent,
           labelColor: Colors.black,
           unselectedLabelColor: Colors.grey.withOpacity(0.5),
           isScrollable: true,
           tabs: <Widget>[
             Tab(
               child: Text('Top',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 17.0
               ),
               ),
             ),
             Tab(
               child: Text('Outdoor',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 17.0
               ),
               ),
             ),
             Tab(
               child: Text('Indoor',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 17.0
               ),
               ),
             ),
             Tab(
               child: Text('Plants',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 17.0
               ),
               ),
             ),
           ], 
        ),
        ),
        Container(
          height: MediaQuery.of(context).size.height -200.0,
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              PlantList(),
              PlantList(),
              PlantList(),
              PlantList(),
            ] 
          ),
        )
       ],
     ),
    );
  }
}
