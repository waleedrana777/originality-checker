import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/models/product.dart';

class ProductSuggestions extends StatefulWidget {
  Product dataa;

  ProductSuggestions({Key? key, required this.dataa}) : super(key: key);

  @override
  _ProductSuggestionsState createState() => _ProductSuggestionsState();
}

class _ProductSuggestionsState extends State<ProductSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestions'),
      ),
      body: BlocBuilder<OriginalityBloc, OriginalityState>(
        builder: (context, state) {
          if (widget.dataa != null) {
            return ProductDescription(dataaValue: widget.dataa);
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

class ProductDescription extends StatefulWidget {
  Product dataaValue;

  ProductDescription({
    Key? key,
    required this.dataaValue,
  }) : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${widget.dataaValue.Img_Url}"),
                // fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            width: 200,
            height: 200,
          )
        ]),
        Padding(padding: const EdgeInsets.all(10)),
        Text(
          '${widget.dataaValue.Name}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
