import 'package:flutter/material.dart';
import '../../repository/beer_repository.dart';
import '../models/beer.dart';
import '../widgets/beertile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Beer> _beers = <Beer>[];

  @override
  void initState() {
    super.initState();
    listenForBeers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.redAccent,
      centerTitle: true,
      title: Text('Hello World Top Beers'),
    ),
    body: ListView.builder(
      itemCount: _beers.length,
      itemBuilder: (context, index) => BeerTile(_beers[index]),
    ),
  );

  void listenForBeers() async {
    final Stream<Beer> stream = await getBeers();
    stream.listen((Beer beer) =>
        setState(() =>  _beers.add(beer))
    );
  }
}
