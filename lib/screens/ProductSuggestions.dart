import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/models/product.dart';
import 'package:originalitygram/router/constants.dart';

class ProductSuggestions extends StatefulWidget {
  Product dataa;
  List<Product> productsList = [];

  ProductSuggestions({Key? key, required this.dataa, required int index})
      : super(key: key);

  @override
  _ProductSuggestionsState createState() => _ProductSuggestionsState();
}

class _ProductSuggestionsState extends State<ProductSuggestions> {
  @override
  dispose() {
    BlocProvider.of<OriginalityBloc>(context).add(
      SuggestionsCleared(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String widgetCategory = widget.dataa.P_Category;

    List<Product> suggestionList =
        BlocProvider.of<OriginalityBloc>(context).state.suggestions;

    List<Product> notRendered =
        BlocProvider.of<OriginalityBloc>(context).state.notRendered;

    // List<Product> rendered = suggestionList.where((pro) => !notRendered.contains(pro)).toList();

    //Building the suggestions
    BlocProvider.of<OriginalityBloc>(context)
        .add(SuggestionsFetched(widgetCategory));

    return Scaffold(
      appBar: AppBar(
        title: Text('Automated Product Suggestions'),
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
      body: BlocBuilder<OriginalityBloc, OriginalityState>(
        builder: (context, state) {
          if (widget.dataa != null) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(children: [
                Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xFF0084ff),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(107, 112, 120, 1),
                                  blurRadius: 15.0, // soften the shadow
                                  spreadRadius: 1.5, //extend the shadow
                                  offset: Offset(
                                    0.2, // Move to right 10  horizontally
                                    0.2, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                              image: DecorationImage(
                                image: NetworkImage("${widget.dataa.Img_Url}"),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            width: 310,
                            height: 310,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${widget.dataa.Name}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Padding(padding: const EdgeInsets.all(10)),
                        //Product details heading
                        Text(
                          'Product Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(10)),
                        Row(
                          children: [
                            //Price Heading
                            Text('Weight: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              '${widget.dataa.Weight} g',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),

                        Padding(padding: const EdgeInsets.all(10)),

                        Row(
                          children: [
                            //Price Heading
                            Text('Brand: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              '${widget.dataa.Brand}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),

                        Padding(padding: const EdgeInsets.all(10)),

                        Row(
                          children: [
                            //Price Heading
                            Text('Condition: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              '${widget.dataa.Condition}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),

                        Padding(padding: const EdgeInsets.all(10)),

                        Row(
                          children: [
                            //Price Heading
                            Text('Color: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              '${widget.dataa.Color}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: const EdgeInsets.all(10)),

                        //show rating by star Images
                        Row(
                          children: [
                            //Price Heading
                            Text('Rating: ${widget.dataa.Rating} / 5',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Builder(builder: (context) {
                              double rating1 =
                                  double.parse(widget.dataa.Rating);
                              List<Widget> liss = [];

                              for (var i = 1; i < rating1; i++) {
                                liss.add(
                                    Icon(Icons.star, color: Color(0xffffea00)));
                              }
                              return Row(
                                children: liss,
                              );
                            }),
                            //Column that has horizontal bars with stars showing rating people who rated product for 1,2,3,4,5
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),

                //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                //Automated Product Suggestions
                Text(
                  'Automated Product Suggestions',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Padding(padding: const EdgeInsets.all(10)),

                BlocBuilder(
                    bloc: BlocProvider.of<OriginalityBloc>(context),
                    builder: (context, state) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.purple, Colors.blue]),
                        ),
                        height: 280,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          //take products from suggestionList and return a list that does not contain any product in notRendered
                          children: suggestionList
                              .where((pro) => !notRendered.contains(pro))
                              .map((product) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, productDetailsRoute,
                                                arguments: product);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${product.Img_Url}"),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            width: 150,
                                            height: 150,
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      BlocProvider.of<
                                                                  OriginalityBloc>(
                                                              context)
                                                          .state
                                                          .notRendered
                                                          .add(product);
                                                    });
                                                  },
                                                  color: Colors.amber,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Icon(Icons
                                                      .do_not_disturb_on_outlined),
                                                )),
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${product.Name}',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      );
                    }),
                //Button to go to home Screen
                Padding(padding: const EdgeInsets.all(10)),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, feedbackRoute);
                  },
                  child: Text('Give Feedback'),
                ),
                Padding(padding: const EdgeInsets.all(10)),
                ElevatedButton(
                  child: Text('Go to Home Screen'),
                  onPressed: () {
                    Navigator.pushNamed(context, homeRoute);
                  },
                ),
              ]),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
