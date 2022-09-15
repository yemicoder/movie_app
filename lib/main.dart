import 'package:flutter/material.dart';
import 'package:movie_app/movie_home.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie app',
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.green,
          ),

          home: MovieHome(),

  ));
}



