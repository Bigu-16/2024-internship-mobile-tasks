import 'package:flutter/material.dart';

import 'details_page.dart';
import 'models/products.dart';
import 'models/products_repository.dart';
import 'search_page.dart';

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

      // initialRoute: '/',
      // routes: {
      //   '/':(context) => const HomePage(),
      //   '/SearchPage': (context) => const SearchPage(),
      //   '/UpdatePage': (context) => UpdatePage(),
      //   '/DetailsPage': (context) => DetailsPage(),

      // },
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

List<Product> products = ProductsRepository.getAll();
List<Card> _buildListCard(int count, BuildContext context) {
  List<Card> cards = List.generate(count, (int index) {
    final product = products[index];
    return Card(
      clipBehavior: Clip.antiAlias,
      // child: GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.white,
        )),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  product: product,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'images/${product.id}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Text(
                            product.price.toString() + '\$',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            product.category,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Spacer(),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          const Text(
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
      // ),
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
                    padding: const EdgeInsets.all(20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 222, 221, 221),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(height: 10),
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
                        Navigator.of(context).push(PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => const SearchPage(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  },
));
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
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                    children: _buildListCard(products.length, context)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(63, 81, 243, 1),
            shape: const CircleBorder(),
            onPressed: () async {
              final Product? newProduct =
                  await Navigator.pushNamed(context, '/UpdatePage') as Product?;

              if (newProduct != null) {
                setState(() {
                  products.add(newProduct);
                  print(products.length);
                });
              }
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SearchPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
