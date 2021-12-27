import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/models/product.dart';
import 'package:originalitygram/router/constants.dart';

class ProductSuggestions extends StatefulWidget {
  Product dataa;

  ProductSuggestions({Key? key, required this.dataa, required int index})
      : super(key: key);

  @override
  _ProductSuggestionsState createState() => _ProductSuggestionsState();
}

class _ProductSuggestionsState extends State<ProductSuggestions> {
  @override
  Widget build(BuildContext context) {
    //Building the suggestions
    var suggestionList = [];
    var widgetCategory = widget.dataa.P_Category;

    for (int i = 0;
        i < BlocProvider.of<OriginalityBloc>(context).state.products.length;
        i++) {
      if (BlocProvider.of<OriginalityBloc>(context)
              .state
              .products[i]
              .P_Category ==
          widgetCategory) {
        suggestionList
            .add(BlocProvider.of<OriginalityBloc>(context).state.products[i]);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Automated Product Suggestions'),
      ),
      body: BlocBuilder<OriginalityBloc, OriginalityState>(
        builder: (context, state) {
          if (widget.dataa != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${widget.dataa.Img_Url}"),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        width: 310,
                        height: 310,
                      ),
                      Padding(padding: const EdgeInsets.all(10)),
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
                          Text('Rating: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Builder(builder: (context) {
                            double rating1 = double.parse(widget.dataa.Rating);
                            List<Widget> liss = [];

                            for (var i = 1; i < rating1; i++) {
                              liss.add(Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ));
                            }
                            return Row(
                              children: liss,
                            );
                          }),
                        ],
                      ),
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
                              height: 240,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: suggestionList
                                    .map((product) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      productDetailsRoute,
                                                      arguments: product);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${product.Img_Url}"),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                  ),
                                                  width: 150,
                                                  height: 150,
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: RaisedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            suggestionList
                                                                .removeWhere(
                                                                    (element) =>
                                                                        element
                                                                            .PID ==
                                                                        product
                                                                            .PID);
                                                            BlocProvider.of<
                                                                        OriginalityBloc>(
                                                                    context)
                                                                .state
                                                                .products
                                                                .removeWhere(
                                                                    (element) =>
                                                                        element
                                                                            .PID ==
                                                                        product
                                                                            .PID);

                                                            print('removed');
                                                            print(suggestionList
                                                                .map((e) =>
                                                                    e.PID ==
                                                                    product.PID));
                                                          });
                                                        },
                                                        color: Colors.amber,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Icon(Icons
                                                            .do_not_disturb_on_outlined),
                                                      )),
                                                ),
                                              ),
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.4,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '${product.Name}',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
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
              ),
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
