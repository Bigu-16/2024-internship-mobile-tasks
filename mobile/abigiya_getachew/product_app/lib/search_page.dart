import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  RangeValues range = const RangeValues(15, 85);
  List<Card> _buildListCard(int count) {
    List<Card> cards = List.generate(count, (int index) {
      return Card(
        clipBehavior: Clip.antiAlias,
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
              decoration: const BoxDecoration(
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
      );
    });
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 16,
          color: const Color.fromRGBO(63, 81, 243, 1),
        ),
        title: const Text(
          'Search Product',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Leather',
                        suffixIcon: IconButton(
                          onPressed: () {
                            debugPrint('Right arrow pressed');
                          },
                          icon: Icon(Icons.arrow_right_alt),
                          color: const Color.fromRGBO(63, 81, 243, 1),
                        )),
                  ),
                ),
                
                  GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) {
                    return  BottomSelect();
                  },
                  );
              },
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(63, 81, 243, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.filter_list, color: Colors.white),
            ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                  padding: const EdgeInsets.only(top:20),
                  children: _buildListCard(3)),
            ),
            
            
          ],
        ),
      ),
    );
  }
}

class BottomSelect extends StatefulWidget {
  const BottomSelect({super.key});

  @override
  State<BottomSelect> createState() => _BottomSelectState();
}

class _BottomSelectState extends State<BottomSelect> {
  @override
  Widget build(BuildContext context) {
    RangeValues range = const RangeValues(15, 85);
    return Container(
              height: 250,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Category'),
                    Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 232, 232, 232),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text('Price'),
                    RangeSlider(
                      values: range,
                      max: 100,
                      min: 0,
                      onChanged: (RangeValues val) {
                        setState(() {
                          range = val;
                        });
                      },
                      activeColor: Color.fromRGBO(63, 81, 243, 1),
                      inactiveColor: Color.fromARGB(255, 232, 232, 232),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(500, 45),
                        backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      onPressed: () {
                        debugPrint('Add Pressed');
                      },
                      child: const Text(
                        'APPLY',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}