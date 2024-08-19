import 'package:clean_app/features/ecommerce/presentation/BLoC/search_bloc/search_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/search_bloc/search_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';

class BottomSelect extends StatefulWidget {
  BottomSelect({super.key});

  @override
  State<BottomSelect> createState() => _BottomSelectState();
}

class _BottomSelectState extends State<BottomSelect> {
  final TextEditingController searchController = TextEditingController();

  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
            const Text('Name'),
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
                // final searchTerm = searchController.text;
                // print(widget.allProduct);
                // context
                //     .read<SearchBloc>()
                //     .add(FilterApplied(searchTerm, widget.allProduct));
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
