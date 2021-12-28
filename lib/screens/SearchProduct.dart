import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/router/constants.dart';
import 'package:originalitygram/screens/ProductSuggestions.dart';
import 'package:originalitygram/screens/Notfound.dart';

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
          ),
          actions: [
            //Button with moon icon to change theme
            IconButton(
              icon: Icon(Icons.brightness_3),
              onPressed: () {
                BlocProvider.of<OriginalityBloc>(context).add(ThemeChanged());
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Originalitygram',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                SizedBox(height: 150),
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
                    callProductPage(context, value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        callProductPage(context, searchController.text);
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

  void callProductPage(BuildContext context, String value) {
    var allProducts = BlocProvider.of<OriginalityBloc>(context).state.products;
    int j = -1;
    bool found = false;

    for (int i = 0, len = allProducts.length; i < len; i++) {
      // print('${allProducts[i].ProductLink} \nsearched against \n  ${value}');

      if (allProducts[i].ProductLink == value) {
        found = true;
        j = i;
      }
      if (found) break;
    }

    if (found) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (blocprovidercontext) => BlocProvider.value(
                    value:
                        BlocProvider.of<OriginalityBloc>(blocprovidercontext),
                    child: ProductSuggestions(dataa: allProducts[j], index: j),
                  )));
    } else {
      Navigator.pushNamed(context, notFoundRoute,
          arguments: searchController.text);
    }
  }
}
