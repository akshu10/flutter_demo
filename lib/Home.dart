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
            const Text('Home'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child:
                    Provider.of<AppState>(context, listen: false).items.isEmpty
                        ? const Text('Add Item')
                        : Text(
                            Provider.of<AppState>(context, listen: false)
                                .items
                                .toString(),
                          )),
          ],
        ),
      ),
    );
  }
}
