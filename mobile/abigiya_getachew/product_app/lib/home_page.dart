import 'package:flutter/material.dart';
import 'package:product_app/details_page.dart';
import 'package:product_app/search_page.dart';
import 'package:product_app/update_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

List<Card> _buildListCard(int count, BuildContext context) {
  List<Card> cards = List.generate(count, (int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.white,
          )),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'images/p2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Derby Leather Shoes',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$120',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Men\'s shoe',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Text(
                              '(4.0)',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
  return cards;
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 222, 221, 221),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'July 14, 2023',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w200),
                      ),
                      Row(
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              // fontSize: 20,
                            ),
                          ),
                          Text(
                            'Yohannes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 222, 221, 221),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        debugPrint('notification button');
                      },
                      icon: const Icon(
                        Icons.notifications,
                        size: 25,
                        color: Color.fromARGB(255, 222, 221, 221),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Available Products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 222, 221, 221),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero, // Remove padding
                      alignment:
                          Alignment.center, // Center the icon within the button
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 25,
                        color: Color.fromARGB(255, 222, 221, 221),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(children: _buildListCard(3, context)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(63, 81, 243, 1),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdatePage()));
            }),
      ),
    );
  }
}
