import 'package:flutter/material.dart';
import 'bloc_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterBlocPage extends StatefulWidget {
  @override
  _FlutterBlocPageState createState() => _FlutterBlocPageState();
}

class _FlutterBlocPageState extends State<FlutterBlocPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloc Dengan Flutter_Bloc",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.indigoAccent[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ColorBloc, Color>(
              builder: (context, currentColor) => AnimatedContainer(
                width: 150.0,
                height: 150.0,
                color: currentColor,
                duration: Duration(milliseconds: 500),
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: () {
                    bloc.dispatch(ColorEvent.to_amber);
                  },
                ),
                SizedBox(
                  width: 50.0,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: () {
                    bloc.dispatch(ColorEvent.to_light_blue);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}