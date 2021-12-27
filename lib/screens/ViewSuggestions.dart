import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/models/product.dart';

class ViewSuggestions extends StatefulWidget {
  Product suggestionProduct;

  ViewSuggestions({
    Key? key,
    required this.suggestionProduct,
  }) : super(key: key);

  @override
  _ViewSuggestionsState createState() => _ViewSuggestionsState();
}

class _ViewSuggestionsState extends State<ViewSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: BlocBuilder<OriginalityBloc, OriginalityState>(
            builder: (context, state) {
          return SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${widget.suggestionProduct.Img_Url}"),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          width: 310,
                          height: 310,
                        ),
                        Padding(padding: const EdgeInsets.all(10)),
                        Text(
                          '${widget.suggestionProduct.Name}',
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
                              '${widget.suggestionProduct.Weight} g',
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
                              '${widget.suggestionProduct.Brand}',
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
                              '${widget.suggestionProduct.Condition}',
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
                              '${widget.suggestionProduct.Color}',
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
                              double rating1 =
                                  double.parse(widget.suggestionProduct.Rating);
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
                        )
                      ])));
        }));
  }
}
