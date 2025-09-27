import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/list_map_provider/add_data_page.dart';
import 'list_map_provider.dart';

class ListMapPage extends StatelessWidget {
  const ListMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListMapPage")),

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
                      trailing: IconButton(
                        onPressed: () {
                          context.read<ListMapProvider>().removeData(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDataPage()),
              );
            },
            child: Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: () {
              context.read<ListMapProvider>().removeData(0);
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
