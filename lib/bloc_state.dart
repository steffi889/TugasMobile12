import 'package:flutter/material.dart';
import 'color_bloc.dart';
class BlocStatePage extends StatefulWidget {
  @override
  _BlocStatePageState createState() => _BlocStatePageState();
}

class _BlocStatePageState extends State<BlocStatePage> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloc State Management",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.purpleAccent,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 150.0,
                  height: 150.0,
                  color: snapshot.data,
                );
              },
            ),
            SizedBox(
              height: 200.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.purpleAccent,
                  onPressed: () {
                    bloc.eventSink.add(ColorEvent.to_purpleAccent);
                  },
                ),
                SizedBox(
                  width: 50.0,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: () {
                    bloc.eventSink.add(ColorEvent.to_blueGrey);
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