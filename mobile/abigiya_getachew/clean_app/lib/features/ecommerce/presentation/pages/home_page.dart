import 'package:clean_app/core/di.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_state.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/details_page.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/search_page.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/update_page.dart';
import 'package:clean_app/features/ecommerce/presentation/widgets/card_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  (const RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
          if (state is FetchLoading){
            return (Text('Loading'));
          }else if (state is FetchFailure){
            return (Text('Failed to fetch'));
          }else if (state is FetchSuccess){
          

            return Padding(
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
                        child: CardBuilder(products: state.product),
                      ),
                    ],
                  ),
                );
          };
         return (Text('test return'));
          },
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
