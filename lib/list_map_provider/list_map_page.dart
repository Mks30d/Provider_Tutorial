import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_map_provider.dart';

class ListMapPage extends StatelessWidget {
  const ListMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ListMapProvider>(
        builder: (consumerContext, provider, _) {
          // var allData = Provider.of<ListMapProvider>(consumerContext).getListData(); // or
          // var allData = consumerContext.watch<ListMapProvider>().getListData(); // or
          var allData = provider.getListData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${allData[index]["id"]}"),
                      subtitle: Text("${allData[index]["name"]}"),
                    );
                  },
                )
              : Center(child: Text("No data found"));
        },
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ListMapProvider>().addData({
                "id": DateTime.now().millisecond,
                "name": "Name",
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
