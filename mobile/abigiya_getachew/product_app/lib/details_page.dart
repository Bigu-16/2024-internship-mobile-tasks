import 'package:flutter/material.dart';
import 'models/products.dart';

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context,))
// }

class DetailsPage extends StatelessWidget {
  final Product product;
   DetailsPage({required this.product, super.key});
  Color color = Colors.white;
  Color textcolor = Colors.black;

  List<Widget> _buildContainer(int count) {
    List<Widget> container = List.generate(
      count,
      (int index) {
        return SizeCard(index: index,);
      },
    );
    return container;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Flexible(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child:
                              Image.asset('images/${product.id}.jpg', fit: BoxFit.fitWidth)),
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
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color.fromRGBO(63, 81, 243, 1),
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
                            style: const TextStyle(fontWeight: FontWeight.w200),
                          ),
                          const Spacer(),
                          const Icon(Icons.star, color: Colors.yellow),
                          const Text(
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
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              )),
                          const Spacer(),
                          Text(product.price.toString() + '\$'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Size:',
                        style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      const SizedBox(height: 20),
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
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.red),
                              minimumSize: Size(150, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 45),
                              backgroundColor:
                                  const Color.fromRGBO(63, 81, 243, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            onPressed: () {
                              debugPrint('Update Pressed');
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
   SizeCard({
    super.key,
   required this.index
  });
  int index;

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  Color color= Colors.white;
  Color textcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(color == Colors.white){
            color = Color.fromRGBO(63, 81, 243, 1);
            textcolor = Colors.white;

          }else{
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
          child: Text('${widget.index + 38}',style: TextStyle(
            color: textcolor,
          ),),
        ),
      ),
    );
  }
}
