import 'package:flutter/material.dart';
import 'package:flutter_demo/model/app_state.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('Home Page'),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AppState>(context, listen: false)
                        .addItem('test');
                  },
                  child: const Text('Add Item'))),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: Provider.of<AppState>(context).items.length,
                  itemBuilder: (context, index) {
                    return Text(Provider.of<AppState>(context).items[index]);
                  }))
        ],
      )),
    );
  }
}
