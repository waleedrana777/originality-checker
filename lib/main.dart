import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/screens/Signin.dart';
import 'bloc/OriginalityBloc.dart';
import 'package:originalitygram/router/Router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Homescreen(),
  );
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (Newcontext) => OriginalityBloc(),
        child: Builder(builder: (Newcontext) {
          return BlocBuilder(
            bloc: BlocProvider.of<OriginalityBloc>(Newcontext),
            builder: (buildContext, state) => MaterialApp(
              initialRoute: '/',
              onGenerateRoute: router.onGenerateRoute,
              theme:
                  BlocProvider.of<OriginalityBloc>(buildContext).state.appTheme,
              home: Signin(),
            ),
          );
        }));
  }
}
