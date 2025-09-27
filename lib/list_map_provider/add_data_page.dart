import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_map_provider.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AddDataPage")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
              "id": DateTime.now().millisecond,
              "name": "Name",
            });
          },
          child: Text("Add Data"),
        ),
      ),
    );
  }
}
