import 'dart:math';

import 'package:constitutionapp/article1.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  width: 600,
                  padding: const EdgeInsets.only(left: 3, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style:
                            ButtonStyle(backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 191, 194, 231))),
                        // style: const ButtonStyle(minimumSize: WidgetStatePropertyAll(Size.fromWidth(50))),
                        onPressed: () {
                          showModalBottomSheet(
                            scrollControlDisabledMaxHeightRatio: 0.9,
                            isScrollControlled: false,
                            enableDrag: true,
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 1000,
                                child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    int i = index + 1;
                                    return ListTile(
                                        title: Row(
                                      children: [
                                        Text(
                                          'Article $i',
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            return;
                                          },
                                          child: const Icon(Icons.arrow_drop_down),
                                        ),
                                      ],
                                    ));
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Article 1', style: Theme.of(context).textTheme.titleMedium),
                      ),
                      const SizedBox(
                        width: 230,
                      ),
                      IconButton(
                        onPressed: () async {
                          final result =
                              await showSearch(context: context, delegate: SearchForKeywords(searchObject: chapter1));
                          //                             SingleChildScrollView(
                          //   controller: controller,
                          //   child: ...,
                          // )
                        },
                        icon: const Icon(Icons.search_rounded),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(),
                    ),
                  ),
                  child: const MyWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class SearchForKeywords extends SearchDelegate {
  Map searchObject;
  List similarsearch = [];
  SearchForKeywords({required this.searchObject});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      GestureDetector(
        onTap: () {
          query = '';
        },
        child: const Icon(
          (Icons.clear),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List similarsearch = [];

    // int numOfclauses = searchObject.keys.toList()[0].length;
    for (var i in searchObject[searchObject.keys.toList()[0]]) {
      // print(searchObject[searchObject.keys.toList()[0]]);
      // i.toString().toLowerCase().contains(query.toLowerCase()) ? similarsearch.add(query) : similarsearch.clear;
      if (i.toString().toLowerCase().contains(query.toLowerCase())) {
        // print(i.toString().toLowerCase());
        if (query.isEmpty) {
          continue;
        } else {
          if (similarsearch.isEmpty) {
            similarsearch.add(
              query,
            );
          } else {
            continue;
          }
        }
      }
    }
    print(similarsearch);
    return ListView.builder(
        itemCount: similarsearch.length,
        itemBuilder: (BuildContext context, int index) {
          var value = similarsearch[index];

          return GestureDetector(
            onTap: () {
              close(context, query);
            },
            child: ListTile(
              title: Text(value),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List similarsearch = [];
    // int numOfclauses = searchObject.keys.toList()[0].length;
    for (var i in searchObject[searchObject.keys.toList()[0]]) {
      // print(searchObject[searchObject.keys.toList()[0]]);
      // i.toString().toLowerCase().contains(query.toLowerCase()) && similarsearch.isEmpty? similarsearch.add(query) : similarsearch.clear;
      if (i.toString().toLowerCase().contains(query.toLowerCase())) {
        // print(i.toString().toLowerCase());
        if (query.isEmpty) {
          continue;
        } else {
          if (similarsearch.isEmpty) {
            similarsearch.add(
              query,
            );
          } else {
            continue;
          }
        }
      }
    }

    return ListView.builder(
        itemCount: similarsearch.length,
        itemBuilder: (BuildContext context, int index) {
          var value = similarsearch[index];

          return GestureDetector(
            onTap: () {
              close(context, null);
            },
            child: ListTile(
              title: Text(value),
            ),
          );
        });
  }
}
