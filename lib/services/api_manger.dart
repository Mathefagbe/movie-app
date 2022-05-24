import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/models/popularmovies.dart';

class MoviesApi {
  Future<PopularMovies> getpopular() async {
    var popularmovies;

    try {
      var response = await http.get(Uri.parse(Strings.Movies_uri));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = json.decode(jsonstring);
        popularmovies = PopularMovies.fromJson(jsonMap);
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return popularmovies;
  }

  Future<PopularMovies> getupcoming() async {
    var upcoming;

    try {
      final response = await http.get(Uri.parse(Strings.upcoming_uri));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = json.decode(jsonstring);
        upcoming = PopularMovies.fromJson(jsonMap);
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return upcoming;
  }

  Future<PopularMovies> gettrending() async {
    var trending;

    try {
      final response = await http.get(Uri.parse(Strings.trending_uri));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = json.decode(jsonstring);
        trending = PopularMovies.fromJson(jsonMap);
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return trending;
  }
}
