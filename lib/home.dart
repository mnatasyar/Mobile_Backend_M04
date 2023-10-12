import 'package:flutter/material.dart';
import 'package:flutter_m04/Http.Helper.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late String result;
  late HttpHelper helper;
  List<String> categories = ['Latest', 'Now Playing', 'Popular', 'Top Rated', 'Upcoming'];
  String selectedCategory = 'Latest'; // Default category

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    result = "";
  }

  void fetchMovies(String category) {
    helper.getMovie(category).then((value) {
      setState(() {
        result = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("My Movie"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: categories.map((String value) {
                  return ChoiceChip(
                    label: Text(value),
                    selected: selectedCategory == value,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = value;
                        fetchMovies(selectedCategory);
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("$result"),
            ),
          ],
        ),
      ),
    );
  }
}
