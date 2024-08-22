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
    double min_val = 15;
    double max_val = 85;
    // RangeValues range = RangeValues(15, 85);
    // final viewInsets = MediaQuery.of(context).viewInsets;

    return 
    // Container(
    //   height: 250,
      // child: 
      Padding(
        padding: EdgeInsets.all(20),
        // padding: EdgeInsets.fromLTRB(20,20,20,viewInsets.bottom + 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Category'),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Text('Price'),
              RangeSlider(
                values: RangeValues(min_val, max_val),
                max: 100,
                min: 0,
                divisions: 5,
                onChanged: (val) {
                  setState(() {
                    min_val = val.start;
                    max_val = val.end;
                  });
                },
                activeColor: Color.fromARGB(255, 63, 81, 243),
                inactiveColor: Color.fromARGB(255, 217, 217, 217),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  backgroundColor: const Color.fromARGB(255, 63, 81, 243),
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
    // );
  }
}
