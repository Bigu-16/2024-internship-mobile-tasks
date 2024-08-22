import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_state.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_event.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/home_page.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Product product;

  DetailsPage({super.key, required this.product});
  Color color = Colors.white;
  Color textcolor = Colors.black;

  List<Widget> _buildContainer(int count) {
    List<Widget> container = List.generate(
      count,
      (int index) {
        return SizeCard(
          index: index,
        );
      },
    );
    return container;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Flexible(
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          child: Image.network(product.imageUrl,
                              fit: BoxFit.fitWidth)),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color.fromARGB(255, 63, 81, 243),
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            product.category,
                            style: TextStyle(fontWeight: FontWeight.w200),
                          ),
                          Spacer(),
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            '(4.0)',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Text(product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              )),
                          Spacer(),
                          Text('\$${product.price}'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Size:',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _buildContainer(7),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          BlocListener<DeleteBloc, DeleteState>(
                            listener: (context, state) {
                              if (state is DeleteSuccess) {
                                context.read<HomePageBloc>().add(FetchData());
                                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('successfully deleted')));
                              } else if (state is DeleteFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Failed to delete')));
                              }
                            },
                            child: OutlinedButton(
                              onPressed: () {
                                context.read<DeleteBloc>().add(DeleteData(product.id));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.red),
                                minimumSize: Size(150, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 45),
                              backgroundColor:
                                  const Color.fromARGB(255, 63, 81, 243),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdatePage(product: product)));
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SizeCard extends StatefulWidget {
  SizeCard({super.key, required this.index});
  int index;

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  Color color = Colors.white;
  Color textcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (color == Colors.white) {
            color = Color.fromARGB(255, 63, 81, 243);
            textcolor = Colors.white;
          } else {
            color = Colors.white;
            textcolor = Colors.black;
          }
        });
      },
      child: Container(
        width: 55,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ]),
        child: Center(
          child: Text(
            '${widget.index + 38}',
            style: TextStyle(
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
