import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../customWidgets/customWidgets.dart';
import '../models/mapData.dart';
import '../routes/routeManager.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String city = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<MapData>().city;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/searchImage.jpg',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myTxtField(
                controller: searchController,
              ),
            ),
            SizedBox(height: 10),
            Consumer<MapData>(
              builder: (context, value, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyanAccent,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        city = searchController.text;
                        MapData().fetchData;
                        context.read<MapData>().city = city;
                        Navigator.of(context)
                            .pushNamed(RouteManager.firstDisplay);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
