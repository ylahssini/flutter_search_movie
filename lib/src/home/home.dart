import 'package:flutter/material.dart';
import 'package:movie_search/src/model/movie.dart';
import 'package:movie_search/src/utils/debounce.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({ Key key, this.title }) : super(key: key);
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _debouncer = Debounce(400);
  Future<Movie> movies;

  void _handleChange(value) {
    _debouncer.run(() {
      movies = getMovies(value);
      print(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: Color.fromRGBO(50, 50, 50, 1.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Type a movie name:',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white)
              ),
            ),
            TextField(
              maxLength: TextField.noMaxLength,
              onChanged: _handleChange,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
              )
            ),
            Center(
              child: FutureBuilder<Movie>(
                future: movies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}