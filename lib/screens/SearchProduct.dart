import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/router/constants.dart';
import 'package:originalitygram/screens/ProductSuggestions.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: TextField(
          autofocus: true,
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        )),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Automated Product Suggestions',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                TextField(
                  controller: this.searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Link',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (value) {
                    callProductPage(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        callProductPage(searchController.text);
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                    ),
                    //Button to clear the input text field
                    IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }

  void callProductPage(String value) {
    var allProducts = BlocProvider.of<OriginalityBloc>(context).state.products;

    for (int i = 0, len = allProducts.length; i < len; i++) {
      print(
          '${allProducts[i].ProductLink} \nsearched against \n  ${searchController.text}');

      if (allProducts[i].ProductLink == searchController.text) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (Blocprovidercontext) => BlocProvider.value(
                      value:
                          BlocProvider.of<OriginalityBloc>(Blocprovidercontext),
                      child: ProductSuggestions(dataa: allProducts[i]),
                    )));
        // Navigator.pushNamed(context, productSuggestionsRoute,
        //     arguments: allProducts[i]);
      }
    }
  }
}