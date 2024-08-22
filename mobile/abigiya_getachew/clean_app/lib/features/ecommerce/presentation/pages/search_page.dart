import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/search_bloc/search_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/search_bloc/search_state.dart';
import 'package:clean_app/features/ecommerce/presentation/widgets/card_builder.dart';
import 'package:clean_app/features/ecommerce/presentation/widgets/filter_bottom_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/search_bloc/search_event.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 16,
          color: const Color.fromARGB(255, 63, 81, 243),
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
                  child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  List<Product> allProduct = [];
                  if (state is SearchSuccess) {
                    allProduct = state.filteredProducts;
                  } else if (state is SearchLoaded) {
                    allProduct = state.products;
                  }
                      return TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hintText: 'Leather',
                            suffixIcon: IconButton(
                              onPressed: () {
                                final searchTerm = searchController.text;
                                context.read<SearchBloc>().add(FilterApplied(
                                      searchTerm, allProduct
                                    ));
                              },
                              icon: Icon(Icons.arrow_right_alt),
                              color: const Color.fromARGB(255, 63, 81, 243),
                            )),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return BottomSelect();
                        });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 63, 81, 243),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(Icons.filter_list, color: Colors.white),
                  ),
                )
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  List<Product> allProduct = [];
                  if (state is SearchSuccess) {
                    allProduct = state.filteredProducts;
                  } else if (state is SearchLoaded) {
                    allProduct = state.products;
                  }

                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded || state is SearchSuccess) {
                    return CardBuilder(products: allProduct);
                  } else if (state is SearchFailure) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}
